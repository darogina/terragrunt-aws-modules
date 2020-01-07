resource "aws_network_acl_rule" "acl_new_subnet_in" {
  count = var.subnet_acl_rule_number != 0 ? 1 : 0

  network_acl_id = aws_network_acl.subnet_acl.id
  rule_number    = var.subnet_acl_rule_number
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.target_subnet_cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "acl_new_subnet_out" {
  count = var.subnet_acl_rule_number != 0 ? 1 : 0

  network_acl_id = aws_network_acl.subnet_acl.id
  rule_number    = var.subnet_acl_rule_number
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.target_subnet_cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "acl_target_subnet_in" {
  count = var.subnet_acl_rule_number != 0 ? 1 : 0

  network_acl_id = var.target_subnet_acl_id
  rule_number    = var.target_subnet_acl_rule_number
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.subnet_cidr
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "acl_target_subnet_out" {
  count = var.subnet_acl_rule_number != 0 ? 1 : 0

  network_acl_id = var.target_subnet_acl_id
  rule_number    = var.target_subnet_acl_rule_number
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.subnet_cidr
  from_port      = 0
  to_port        = 0
}
