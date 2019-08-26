output "finance_user_password" {
  value = "${aws_iam_user_login_profile.finance_user.encrypted_password}"
}

output "finance_username" {
  value = "${aws_iam_user.finance_user.name}"
}
