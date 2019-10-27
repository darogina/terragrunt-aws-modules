variable "administrator_default_arn" {
  description = "The default ARN for Administrators"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "billing_default_arn" {
  description = "The default ARN for Billing"
  type        = string
  default     = "arn:aws:iam::aws:policy/job-function/Billing"
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
