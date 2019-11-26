variable "account_name" {
  description = "The name of the account"
}

variable "vpc_flow_logs_publisher_role_arn" {
  description = "The ARN of the IAM Role which will be used to publish VPC Flow Logs."
}

variable "vpc_log_group_name" {
  description = "The name of CloudWatch Logs group to which VPC Flow Logs are delivered."
  default     = "default-vpc-flow-logs"
}

variable "vpc_log_retention_in_days" {
  description = "Number of days to retain logs for."
  default     = 365
}
