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

resource "aws_organizations_account" "account" {
  name  = "${var.account_name}"
  email = "${var.account_email_slug}@${var.domain}"

  lifecycle {
    prevent_destroy = true
  }
}

provider "aws" {
  alias = "assume_account"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }

  region = "${var.aws_region}"
}

module "cross_account_role_account_administrator" {
  source = "../utility/cross-account-role"

  providers = {
    aws = "aws.assume_account"
  }

  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "AdministratorRole"
  role_policy_arn         = "${var.administrator_default_arn}"
}

module "assume_role_policy_account_administrator" {
  source = "../utility/assume-role-policy"

  account_name = "${var.account_name}"
  account_id   = "${aws_organizations_account.account.id}"
  role         = "${module.cross_account_role_account_administrator.role_name}"
}

module "assume_role_policy_organisation_account_access" {
  source = "../utility/assume-role-policy"

  account_name = "${var.account_name}"
  account_id   = "${aws_organizations_account.account.id}"
  role         = "OrganizationAccountAccessRole"
}
