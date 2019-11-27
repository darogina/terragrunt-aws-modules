module "public_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone = "${var.availability_zone}"
  subnet_cidr       = var.subnet_cidr
  vpc_id            = "${data.terraform_remote_state.environment_vpc.outputs.vpc_id}"
}

resource "aws_route" "gateway_route" {
  route_table_id         = module.public_subnet.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.terraform_remote_state.environment_vpc.outputs.internet_gateway_id
}
