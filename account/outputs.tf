output "account_id" {
  value = "${aws_organizations_account.account.id}"
}

output "admin_role_policy_arn" {
  value = "${module.assume_role_policy_account_admin.policy_arn}"
}
