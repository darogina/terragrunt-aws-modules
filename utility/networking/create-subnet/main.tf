resource "aws_subnet" "subnet" {
  availability_zone = var.availability_zone
  cidr_block        = var.subnet_cidr
  vpc_id            = var.vpc_id
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_network_acl" "subnet_acl" {
  subnet_ids = [aws_subnet.subnet.id]
  vpc_id     = var.vpc_id
}
