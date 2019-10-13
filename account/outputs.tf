output "account_id" {
  value = "${aws_organizations_account.account.id}"
}

output "account_name" {
  value = "${aws_organizations_account.account.name}"
}

output "admin_role_policy_arn" {
  value = "${module.assume_role_policy_account_administrator.policy_arn}"
}

output "org_account_access_role_policy_arn" {
  value = "${module.assume_role_policy_organisation_account_access.policy_arn}"
}
