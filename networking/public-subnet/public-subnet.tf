module "public_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone = "${var.availability_zone}"
  subnet_cidr       = var.subnet_cidr
  subnet_name       = "${var.availability_zone}-${var.subnet_name}"
  vpc_id            = "${data.terraform_remote_state.environment_vpc.outputs.vpc_id}"
}

resource "aws_route" "gateway_route" {
  route_table_id         = module.public_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.terraform_remote_state.environment_vpc.outputs.internet_gateway_id
}

resource "aws_network_acl_rule" "public_acl_internet_in" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32766
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_internet_out" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32766
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_192_168_in" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32765
  egress         = false
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "192.168.0.0/16"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_192_168_out" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32765
  egress         = true
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "192.168.0.0/16"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_172_16_in" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32764
  egress         = false
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "172.16.0.0/12"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_172_16_out" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32764
  egress         = true
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "172.16.0.0/12"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_10_in" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32763
  egress         = false
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "10.0.0.0/8"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_deny_private_10_out" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 32763
  egress         = true
  protocol       = -1
  rule_action    = "deny"
  cidr_block     = "10.0.0.0/8"
  from_port      = 0
  to_port        = 0
}
