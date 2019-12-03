resource "aws_network_acl" "nat" {
  vpc_id = var.vpc_id

  # allow all traffic from instances inside the VPC.
  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.private_subnet_cidr
    from_port  = 0
    to_port    = 0
  }

  # allow all returning traffic from the internet.
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # allow all traffic to the internet.
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
}
