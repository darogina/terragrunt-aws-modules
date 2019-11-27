output "terraform_user_access_key" {
  value = "${aws_iam_access_key.terraform_user.id}"
}

output "terraform_user_secret_key" {
  value = "${aws_iam_access_key.terraform_user.encrypted_secret}"
}
