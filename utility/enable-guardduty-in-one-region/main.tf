resource "aws_guardduty_detector" "default" {
  finding_publishing_frequency = var.finding_publishing_frequency

  provider = aws.member
}

resource "aws_guardduty_member" "member" {
  depends_on = [aws_guardduty_detector.default]

  count = var.master_account_id != "" ? 1 : 0

  provider = aws.master

  account_id                 = aws_guardduty_detector.default.account_id
  detector_id                = var.master_detector_id
  disable_email_notification = true
  email                      = var.member_account_email
  invite                     = true
}

resource "aws_guardduty_invite_accepter" "master" {
  depends_on = [aws_guardduty_member.member]

  count = var.master_account_id != "" ? 1 : 0

  provider = aws.member

  detector_id       = aws_guardduty_detector.default.id
  master_account_id = var.master_account_id
}
