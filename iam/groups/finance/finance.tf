data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "finance" {
  name = "finance"
}

resource "aws_iam_group_policy_attachment" "billing" {
  group      = aws_iam_group.finance.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
