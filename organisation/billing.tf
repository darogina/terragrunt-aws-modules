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

module "cross_account_role_master_billing" {
  source = "../utility/cross-account-role"

  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "Billing"
  role_policy_arn         = "${var.billing_default_arn}"
}

module "assume_role_policy_master_billing" {
  source = "../utility/assume-role-policy"

  account_name = "master"
  account_id   = "${data.aws_caller_identity.current.account_id}"
  role         = "${module.cross_account_role_master_billing.role_name}"
}
