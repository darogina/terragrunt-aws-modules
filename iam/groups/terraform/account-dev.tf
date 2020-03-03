data "terraform_remote_state" "dev" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/dev/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_dev" {
  group      = aws_iam_group.terraform.name
  policy_arn = data.terraform_remote_state.dev.outputs.org_account_access_role_policy_arn
}