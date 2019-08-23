resource "aws_organizations_organization" "master" {
  feature_set = "ALL"

  lifecycle {
    prevent_destroy = true
  }
}
