data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "terragrunt" {
  name = "terragrunt"
}

resource "aws_iam_group_policy_attachment" "terragrunt_data_administrator" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = data.terraform_remote_state.master.outputs.terragrunt_data_administrator_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_terragrunt_administrator" {
  group      = aws_iam_group.terragrunt.name
  policy_arn = data.terraform_remote_state.master.outputs.assume_terragrunt_administrator_role_policy_arn
}
