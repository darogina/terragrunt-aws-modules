variable "availability_zone" {
  description = "The availability zone to create the subnet in"
  type        = string
}

variable "subnet_cidr" {
  description = "The intended CIDR range of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the account VPC"
  type        = string
}
