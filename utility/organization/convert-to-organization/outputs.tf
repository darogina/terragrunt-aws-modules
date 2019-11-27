output "organization_admin_role_policy_arn" {
  value = "${module.assume_role_organization_admin.policy_arn}"
}
