output "acl_id" {
  value = "${module.private_subnet.acl_id}"
}

output "nat_gateway_id" {
  value = "${module.nat_gateway.nat_gateway_id}"
}

output "route_table_id" {
  value = "${module.private_subnet.route_table_id}"
}

output "subnet_id" {
  value = "${module.private_subnet.subnet_id}"
}
