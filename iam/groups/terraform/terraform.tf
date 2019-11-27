data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "terraform" {
  name = "terraform"
}

resource "aws_iam_group_policy_attachment" "terraform_data_administrator" {
  group      = aws_iam_group.terraform.name
  policy_arn = data.terraform_remote_state.master.outputs.terraform_data_administrator_policy_arn
}

resource "aws_iam_group_policy_attachment" "assume_terraform_administrator" {
  group      = aws_iam_group.terraform.name
  policy_arn = data.terraform_remote_state.master.outputs.assume_terraform_administrator_role_policy_arn
}
