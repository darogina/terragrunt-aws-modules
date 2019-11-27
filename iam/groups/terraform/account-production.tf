data "terraform_remote_state" "production" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/production/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group_policy_attachment" "assume_role_organization_account_access_production" {
  group      = aws_iam_group.terraform.name
  policy_arn = data.terraform_remote_state.production.outputs.org_account_access_role_policy_arn
}
