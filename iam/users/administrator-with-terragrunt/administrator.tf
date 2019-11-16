resource "aws_iam_user" "admin_user" {
  name          = var.admin_email
  force_destroy = true
}

resource "aws_iam_user_login_profile" "admin_user" {
  user    = aws_iam_user.admin_user.name
  pgp_key = "keybase:${var.keybase}"
}

resource "aws_iam_access_key" "admin_user" {
  user    = aws_iam_user.admin_user.name
  pgp_key = "keybase:${var.keybase}"
}


resource "aws_iam_user_group_membership" "administrator_groups" {
  user = aws_iam_user.admin_user.name

  groups = [
    "administrators",
    "terragrunt",
    "users"
  ]
}
