variable "audit_logs_bucket_id" {
  description = "The id of the S3 bucket holding audit data"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  type        = string
}

variable "cloudtrail_bucket_name" {
  description = "The name of the S3 bucket holding cloudtrail data"
  type        = string
}
