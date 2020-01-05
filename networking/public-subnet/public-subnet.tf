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

resource "aws_network_acl_rule" "public_acl_default_in" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_acl_default_out" {
  network_acl_id = module.public_subnet.acl_id
  rule_number    = 100
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}
