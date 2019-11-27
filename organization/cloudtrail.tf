module "cloudtrail" {
  source = "../cloudtrail"

  audit_logs_bucket_id   = "${aws_s3_bucket.audit_logs.id}"
  aws_region             = "${var.aws_region}"
  cloudtrail_bucket_name = "${var.cloudtrail_bucket_name}"
}
