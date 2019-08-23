data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "crossaccount_assume_from_master" {
  statement {
    sid     = "AssumeFromMaster"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}
data "terraform_remote_state" "staging" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/staging/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

provider "aws" {
  alias = "assume_account"

  assume_role {
    role_arn = "arn:aws:iam::${data.terraform_remote_state.staging.outputs.account_id}:role/OrganizationAccountAccessRole"
  }

  region = "${var.aws_region}"
}

module "cross_account_role" {
  source = "../../../utility/cross-account-role"

  providers = {
    aws = "aws.assume_account"
  }

  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "PowerUser"
  role_policy_arn         = "${var.power_user_default_arn}"
}

module "assume_role_policy_staging_power_user" {
  source = "../../../utility/assume-role-policy"

  account_name = "${data.terraform_remote_state.staging.outputs.account_name}"
  account_id   = "${data.terraform_remote_state.staging.outputs.account_id}"
  role         = "${module.cross_account_role.role_name}"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_admin" {
  group      = "${aws_iam_group.developers.name}"
  policy_arn = "${module.assume_role_policy_staging_power_user.policy_arn}"
}
