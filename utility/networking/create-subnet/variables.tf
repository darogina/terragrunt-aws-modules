variable "availability_zone" {
  description = "The availability zone to create the subnet in"
  type        = string
}

variable "subnet_acl_rule_number" {
  description = "The rule number to be used in the subnet network ACL"
  type        = number
  default     = 0
}

variable "subnet_cidr" {
  description = "The intended CIDR range of the subnet"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "target_subnet_acl_id" {
  description = "The ID of the target subnet network ACL"
  type        = string
  default     = ""
}

variable "target_subnet_acl_rule_number" {
  description = "The rule number to be used in the target subnet network ACL"
  type        = number
  default     = 0
}

variable "target_subnet_cidr_block" {
  description = "The CIDR block of the subnet to create bi-directional network ACLs with"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the account VPC"
  type        = string
}
