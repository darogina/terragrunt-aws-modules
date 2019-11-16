resource "aws_iam_group" "users" {
  name = "users"
}

resource "aws_iam_policy" "force_mfa" {
  name   = "Force_MFA"
  path   = "/"
  policy = data.aws_iam_policy_document.force_mfa.json
}

resource "aws_iam_group_policy_attachment" "assign_force_mfa_policy" {
  group      = aws_iam_group.users.name
  policy_arn = aws_iam_policy.force_mfa.arn
}
