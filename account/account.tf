resource "aws_organizations_account" "account" {
  name  = "${var.account_name}"
  email = "${var.account_email_slug}@${var.domain}"

  lifecycle {
    prevent_destroy = true
  }
}
