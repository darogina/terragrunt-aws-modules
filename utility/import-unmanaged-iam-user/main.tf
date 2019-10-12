data "aws_caller_identity" "current" {}

data "aws_iam_policy" "policy" {
  arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.policy_name}"
}

resource "aws_iam_policy" "policy" {
  name   = "${var.policy_name}"
  policy = "${data.aws_iam_policy.policy.policy}"
}

resource "aws_iam_user" "user" {
  name          = "${var.username}"
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = "${aws_iam_user.user.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
