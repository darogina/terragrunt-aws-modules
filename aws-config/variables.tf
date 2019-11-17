variable "account_id" {
  description = "The ID of the account"
  type        = string
}

variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "audit_logs_bucket_arn" {
  description = "The ARN of the S3 bucket holding audit data"
  type        = string
}

variable "audit_logs_bucket_id" {
  description = "The ID of the S3 bucket holding audit data"
  type        = string
}

variable "region" {
  description = "The default region for AWS Config data to be held)"
  type        = string
}
