resource "aws_iam_user" "terragrunt_user" {
  name          = "${var.username}"
  force_destroy = true
}

resource "aws_iam_user_group_membership" "terragrunt_groups" {
  user = "${aws_iam_user.terragrunt_user.name}"

  groups = [
    "terragrunt"
  ]
}

resource "aws_iam_access_key" "terragrunt_user" {
  user    = "${aws_iam_user.terragrunt_user.name}"
  pgp_key = "keybase:${var.keybase}"
}
