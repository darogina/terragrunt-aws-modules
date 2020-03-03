data "terraform_remote_state" "first_run" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "first-run/convert-to-organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}



data "terraform_remote_state" "sub_accounts" {
  for_each = toset(var.sub_account_names)

  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/${each.key}/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "administrators" {
  name = "administrators"
}

resource "aws_iam_group_policy_attachment" "assume_role_organization_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.first_run.outputs.organization_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_sub_account_admin" {
  for_each = toset(var.sub_account_names)

  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.sub_accounts[each.key].outputs.admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_terraform_data_reader" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.master.outputs.assume_terraform_data_reader_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_billing" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.master.outputs.master_billing_role_policy_arn
}
