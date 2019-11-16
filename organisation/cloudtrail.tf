module "cloudtrail" {
  source = "../cloudtrail"

  audit_logs_bucket_name = "${var.audit_logs_bucket_name}"
  aws_region             = "${var.aws_region}"
  cloudtrail_bucket_name = "${var.cloudtrail_bucket_name}"
}
