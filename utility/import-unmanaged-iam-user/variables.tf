variable "policy_name" {
  description = "The name of the unmanaged policy applied to the user"
  type        = string
  default     = "TerragruntInit"
}

variable "username" {
  description = "The username applied to the unmanaged user"
  type        = string
  default     = "terragrunt.init"
}
