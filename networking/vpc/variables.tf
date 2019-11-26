variable "account_name" {
  description = "The name of the account"
}

variable "cidr_block" {
  description = "The CIDR block to assign to the VPC"
}

variable "vpc_flow_logs_publisher_role_arn" {
  description = "The ARN of the IAM Role which will be used to publish VPC Flow Logs."
}

variable "vpc_log_group_name" {
  description = "The name of CloudWatch Logs group to which VPC Flow Logs are delivered."
  default     = "vpc-flow-logs"
}

variable "vpc_log_retention_in_days" {
  description = "The length of time to retain VPC flow logs, in days"
  default     = 365
}
