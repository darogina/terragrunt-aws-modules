module "assume_role_master_billing" {
  source = "../utility/create-role"

  account_name            = "master"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "Billing"
  role_policy_arn         = "${var.billing_default_arn}"
}
