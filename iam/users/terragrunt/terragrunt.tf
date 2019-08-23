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
