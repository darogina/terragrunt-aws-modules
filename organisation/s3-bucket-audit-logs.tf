resource "aws_s3_bucket" "audit_logs" {
  bucket = var.audit_logs_bucket_name

  acl           = "log-delivery-write"
  force_destroy = false

  lifecycle_rule {
    id      = "auto-archive"
    enabled = true

    transition {
      days          = "60"
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "audit_logs" {
  bucket = aws_s3_bucket.audit_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.audit_logs
  ]
}

module "audit_log_bucket_policy" {
  source = "../utility/audit-log-bucket-policy-for-all-accounts"

  audit_logs_bucket_arn = aws_s3_bucket.audit_logs.arn
  audit_logs_bucket_id  = aws_s3_bucket.audit_logs.id
  module_depends_on     = [aws_s3_bucket_public_access_block.audit_logs.id]
}
