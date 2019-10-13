data "terraform_remote_state" "staging" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/staging/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group_policy_attachment" "assume_role_staging_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.staging.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_staging" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.staging.outputs.org_account_access_role_policy_arn}"
}
