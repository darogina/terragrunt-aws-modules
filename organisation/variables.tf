variable "admin_email" {
  description = "The email address assigned to the terraform-created administrator user"
  type        = string
}

variable "administrator_default_arn" {
  description = "The default ARN for Administrators"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "audit_logs_bucket_name" {
  description = "The name of the S3 bucket holding audit data"
  type        = string
}

variable "billing_alarm_currency" {
  description = "The currency of the billing alarm"
  type        = string
  default     = "USD"
}

variable "billing_alarm_threshold" {
  description = "The threshold of the billing alarm"
  type        = string
}

variable "billing_default_arn" {
  description = "The default ARN for Billing"
  type        = string
  default     = "arn:aws:iam::aws:policy/job-function/Billing"
}

variable "cloudtrail_bucket_name" {
  description = "The name of the S3 bucket holding cloudtrail data"
  type        = string
}

variable "tfstate_global_bucket" {
  description = "The S3 bucket that holds Terraform state"
  type        = string
}

variable "tfstate_global_dynamodb" {
  description = "The DynamoDB table that holds Terraform locks"
  type        = string
}

variable "vpc_iam_role_name" {
  description = "The name of the IAM Role which VPC Flow Logs will use."
  default     = "MasterVPCFlowLogsPublisherRole"
}

variable "vpc_iam_role_policy_name" {
  description = "The name of the IAM Role Policy which VPC Flow Logs will use."
  default     = "MasterVPCFlowLogsPublisherRole"
}
