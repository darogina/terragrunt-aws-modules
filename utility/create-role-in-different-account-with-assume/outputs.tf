output "role_name" {
  value = "${module.create_role.name}"
}

output "policy_arn" {
  value = "${module.assume_role.policy_arn}"
}
