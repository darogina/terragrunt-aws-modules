output "acl_id" {
  value = "${module.private_subnet.acl_id}"
}

output "cidr_block" {
  value = "${var.subnet_cidr}"
}

output "route_table_id" {
  value = "${module.private_subnet.route_table_id}"
}

output "subnet_id" {
  value = "${module.private_subnet.subnet_id}"
}
