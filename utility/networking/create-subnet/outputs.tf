output "route_table_id" {
  value = "${aws_route_table.route_table.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}
