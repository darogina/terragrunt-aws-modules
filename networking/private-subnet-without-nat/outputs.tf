output "route_table_id" {
  value = "${module.private_subnet.route_table_id}"
}

output "subnet_id" {
  value = "${module.private_subnet.subnet_id}"
}
