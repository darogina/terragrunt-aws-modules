data "aws_caller_identity" "current" {}

data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organisation/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}
