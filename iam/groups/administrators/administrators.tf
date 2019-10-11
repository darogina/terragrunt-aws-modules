data "terraform_remote_state" "first_run" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "first-run/convert-to-organisation/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organisation/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "management" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/management/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "production" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/production/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "staging" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/staging/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "administrators" {
  name = "administrators"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_admin" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.first_run.outputs.organisation_admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_management_admin" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.management.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_production_admin" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.production.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_staging_admin" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.staging.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_terragrunt_reader" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.master.outputs.terragrunt_reader_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_billing" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "${data.terraform_remote_state.master.outputs.master_billing_role_policy_arn}"
}
