output "audit_logs_bucket_arn" {
  value = "${aws_s3_bucket.audit_logs.arn}"
}

output "audit_logs_bucket_id" {
  value = "${aws_s3_bucket.audit_logs.id}"
}

output "cloudtrail_bucket_arn" {
  value = "${aws_s3_bucket.cloudtrail.arn}"
}

output "cloudtrail_bucket_id" {
  value = "${aws_s3_bucket.cloudtrail.id}"
}
