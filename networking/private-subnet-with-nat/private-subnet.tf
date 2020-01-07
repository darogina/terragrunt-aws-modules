module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone             = var.availability_zone
  subnet_acl_rule_number        = var.acl_rule_number
  subnet_cidr                   = var.subnet_cidr
  subnet_name                   = "${var.availability_zone}-${var.subnet_name}"
  target_subnet_acl_id          = data.terraform_remote_state.environment_public_subnet.outputs.acl_id
  target_subnet_acl_rule_number = var.public_subnet_acl_rule_number
  target_subnet_cidr_block      = data.terraform_remote_state.environment_public_subnet.outputs.cidr_block
  vpc_id                        = data.terraform_remote_state.environment_vpc.outputs.vpc_id
}

module "nat_gateway" {
  source = "../../utility/networking/create-nat-gateway"

  private_subnet_cidr = var.subnet_cidr
  public_subnet_id    = data.terraform_remote_state.environment_public_subnet.outputs.subnet_id
  vpc_id              = data.terraform_remote_state.environment_vpc.outputs.vpc_id
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = module.private_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gateway.nat_gateway_id
}
