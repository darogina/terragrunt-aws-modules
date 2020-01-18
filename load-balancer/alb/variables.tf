variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "tfstate_global_bucket" {
  description = "The S3 bucket that holds Terraform state"
  type        = string
}

variable "tfstate_global_bucket_region" {
  description = "The region of the S3 bucket that holds Terraform state"
  type        = string
}
