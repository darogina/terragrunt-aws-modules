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

module "assume_role_staging_power_user" {
  source = "../../../utility/create-role-in-different-account-with-assume"

  account_name            = "${data.terraform_remote_state.staging.outputs.account_name}"
  account_id              = "${data.terraform_remote_state.staging.outputs.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "PowerUser"
  role_policy_arn         = "${var.power_user_default_arn}"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_policy_attachment" "assume_role_power_user" {
  group      = aws_iam_group.developers.name
  policy_arn = module.assume_role_staging_power_user.policy_arn
}

