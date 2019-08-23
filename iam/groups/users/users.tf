resource "aws_iam_group" "users" {
  name = "users"
}

resource "aws_iam_group_policy_attachment" "allow_change_password" {
  group      = "${aws_iam_group.users.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}
