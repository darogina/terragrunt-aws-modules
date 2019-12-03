module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone = var.availability_zone
  subnet_cidr       = var.subnet_cidr
  vpc_id            = "${data.terraform_remote_state.environment_vpc.outputs.vpc_id}"
}

module "nat_gateway" {
  source = "../../utility/networking/create-nat-gateway"

  private_subnet_cidr = var.subnet_cidr
  public_subnet_id    = "${data.terraform_remote_state.environment_public_subnet.outputs.subnet_id}"
  vpc_id              = "${data.terraform_remote_state.environment_vpc.outputs.vpc_id}"
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = module.private_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gateway.nat_gateway_id
}
