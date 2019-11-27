resource "aws_vpc" "vpc" {
  cidr_block                       = var.cidr_block
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_default_network_acl" "default_nacl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
}

resource "aws_default_route_table" "default_route_route" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
}

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "${var.account_name}-${var.vpc_log_group_name}"
  retention_in_days = var.vpc_log_retention_in_days
}

resource "aws_flow_log" "all" {
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  iam_role_arn    = data.terraform_remote_state.master.outputs.vpc_flow_logs_publisher_role_arn
  vpc_id          = aws_vpc.vpc.id
  traffic_type    = "ALL"
}
