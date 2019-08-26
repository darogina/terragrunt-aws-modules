output "admin_user_access_key" {
  value = "${aws_iam_access_key.admin_user.id}"
}

output "admin_user_password" {
  value = "${aws_iam_user_login_profile.admin_user.encrypted_password}"
}

output "admin_user_secret_key" {
  value = "${aws_iam_access_key.admin_user.encrypted_secret}"
}

output "admin_username" {
  value = "${aws_iam_access_key.admin_user.name}"
}
