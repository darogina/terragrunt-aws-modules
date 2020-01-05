output "acl_id" {
  value = "${aws_network_acl.subnet_acl.id}"
}

output "route_table_id" {
  value = "${aws_route_table.route_table.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}
