variable "audit_logs_bucket_name" {
  description = "The name of the S3 bucket holding audit data"
  type        = string
}

variable "cloudtrail_bucket_name" {
  description = "The name of the S3 bucket holding cloudtrail data"
  type        = string
}
