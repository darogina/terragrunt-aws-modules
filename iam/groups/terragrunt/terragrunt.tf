data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organisation/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

resource "aws_iam_group" "terragrunt" {
  name = "terragrunt"
}

resource "aws_iam_group_policy_attachment" "terragrunt_admin" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "${data.terraform_remote_state.master.outputs.terragrunt_admin_policy_arn}"
}

resource "aws_iam_group_policy_attachment" "iam_full_access" {
  group      = "${aws_iam_group.terragrunt.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
