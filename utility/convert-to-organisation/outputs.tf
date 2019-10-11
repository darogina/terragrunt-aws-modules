output "organisation_admin_role_policy_arn" {
  value = "${module.assume_role_policy_organisation_admin.policy_arn}"
}
