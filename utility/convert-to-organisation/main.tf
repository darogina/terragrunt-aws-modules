data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_from_master" {
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

resource "aws_organizations_organization" "master" {
  feature_set = "ALL"

  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com"
  ]

  lifecycle {
    prevent_destroy = true
  }
}

module "assume_role_organisation_admin" {
  source = "../create-role-with-assume"

  account_name            = "master"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.assume_from_master.json}"
  role                    = "Administrator"
  role_policy_arn         = "arn:aws:iam::aws:policy/AdministratorAccess"
}
