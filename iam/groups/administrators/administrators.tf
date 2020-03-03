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

data "terraform_remote_state" "data" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/data/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "dev" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/dev/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

# data "terraform_remote_state" "staging" {
#   backend = "s3"

#   config = {
#     bucket = "${var.tfstate_global_bucket}"
#     key    = "accounts/staging/terraform.tfstate"
#     region = "${var.tfstate_global_bucket_region}"
#   }
# }

resource "aws_iam_group" "administrators" {
  name = "administrators"
}

resource "aws_iam_group_policy_attachment" "assume_role_organization_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.first_run.outputs.organization_admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_data_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.data.outputs.admin_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_dev_admin" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.dev.outputs.admin_role_policy_arn
}

# resource "aws_iam_group_policy_attachment" "assume_role_staging_admin" {
#   group      = aws_iam_group.administrators.name
#   policy_arn = data.terraform_remote_state.staging.outputs.admin_role_policy_arn
# }

resource "aws_iam_group_policy_attachment" "assume_role_terraform_data_reader" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.master.outputs.assume_terraform_data_reader_role_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_role_billing" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.terraform_remote_state.master.outputs.master_billing_role_policy_arn
}
