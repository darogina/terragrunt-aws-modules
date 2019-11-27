resource "aws_iam_user" "terraform_user" {
  name          = var.username
  force_destroy = true
}

resource "aws_iam_user_group_membership" "terraform_groups" {
  user = aws_iam_user.terraform_user.name

  groups = [
    "terraform"
  ]
}

resource "aws_iam_access_key" "terraform_user" {
  user    = aws_iam_user.terraform_user.name
  pgp_key = "keybase:${var.keybase}"
}
