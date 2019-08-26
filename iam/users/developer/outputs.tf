output "developer_user_access_key" {
  value = "${aws_iam_access_key.developer_user.id}"
}

output "developer_user_password" {
  value = "${aws_iam_user_login_profile.developer_user.encrypted_password}"
}

output "developer_user_secret_key" {
  value = "${aws_iam_access_key.developer_user.encrypted_secret}"
}

output "developer_username" {
  value = "${aws_iam_user.developer_user.name}"
}
