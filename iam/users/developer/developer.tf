resource "aws_iam_user" "developer_user" {
  name          = "${var.developer_email}"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "developer_user" {
  user    = "${aws_iam_user.developer_user.name}"
  pgp_key = "keybase:${var.keybase}"
}

resource "aws_iam_access_key" "developer_user" {
  user    = "${aws_iam_user.developer_user.name}"
  pgp_key = "keybase:${var.keybase}"
}


resource "aws_iam_user_group_membership" "developers_groups" {
  user = "${aws_iam_user.developer_user.name}"

  groups = [
    "developers",
    "users"
  ]
}
