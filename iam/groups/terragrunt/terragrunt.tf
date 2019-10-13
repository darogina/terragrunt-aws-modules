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

resource "aws_iam_group" "terragrunt" {
  name = "terragrunt"
}

resource "aws_iam_group_policy_attachment" "assume_role_management_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.management.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_management" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.management.outputs.org_account_access_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_production_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.production.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_production" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.production.outputs.org_account_access_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_staging_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.staging.outputs.admin_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "assume_role_organisation_account_access_staging" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.staging.outputs.org_account_access_role_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "terragrunt_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.master.outputs.terragrunt_admin_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "terragrunt_reader" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.master.outputs.terragrunt_reader_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "iam_full_access" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
