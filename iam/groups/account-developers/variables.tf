variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "power_user_default_arn" {
  description = "The default ARN for Administrators"
  type        = string
  default     = "arn:aws:iam::aws:policy/PowerUserAccess"
}

variable "tfstate_global_bucket" {
  description = "The S3 bucket that holds Terraform state"
  type        = string
}

variable "tfstate_global_bucket_region" {
  description = "The region of the S3 bucket that holds Terraform state"
  type        = string
}
