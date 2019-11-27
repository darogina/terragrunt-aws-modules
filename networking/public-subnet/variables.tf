variable "account_name" {
  description = "The name of the account"
  type        = string
}

variable "availability_zone" {
  description = "The letter of the availability zone to create the subnet in"
  type        = string
  default     = "a"
}

variable "subnet_cidr" {
  description = "The intended CIDR range of the subnet"
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
