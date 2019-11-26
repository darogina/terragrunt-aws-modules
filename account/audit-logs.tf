module "audit_log_bucket_policy" {
  source = "../utility/s3/audit-log-bucket-policy-for-all-accounts"

  audit_logs_bucket_arn = "${data.terraform_remote_state.master.outputs.audit_logs_bucket_arn}"
  audit_logs_bucket_id  = "${data.terraform_remote_state.master.outputs.audit_logs_bucket_id}"
  module_depends_on     = ["${aws_organizations_account.account.id}"]
}
