variable "audit_logs_bucket_arn" {
  description = "The ARN of the S3 bucket holding audit data"
  type        = string
}

variable "audit_logs_bucket_id" {
  description = "The ID of the S3 bucket holding audit data"
  type        = string
}

variable "module_depends_on" {
  type    = any
  default = null
}
