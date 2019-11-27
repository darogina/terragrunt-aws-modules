output "internet_gateway_id" {
  value = "${aws_internet_gateway.gw.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
