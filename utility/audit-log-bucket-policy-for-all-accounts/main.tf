resource "null_resource" "depends_on" {
  triggers = {
    depends_on = join("", var.module_depends_on)
  }
}

resource "aws_s3_bucket_policy" "audit_logs" {
  bucket = var.audit_logs_bucket_id

  policy = data.aws_iam_policy_document.audit_log_policy.json
}
