output "terragrunt_user_access_key" {
  value = "${aws_iam_access_key.terragrunt_user.id}"
}

output "terragrunt_user_secret_key" {
  value = "${aws_iam_access_key.terragrunt_user.encrypted_secret}"
}
