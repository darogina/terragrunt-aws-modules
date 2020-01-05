output "acl_id" {
  value = "${module.public_subnet.acl_id}"
}

output "route_table_id" {
  value = "${module.public_subnet.route_table_id}"
}

output "subnet_id" {
  value = "${module.public_subnet.subnet_id}"
}
