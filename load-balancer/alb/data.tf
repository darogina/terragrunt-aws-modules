data "terraform_remote_state" "master" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "organization/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "account" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "accounts/${lower(var.account_name)}/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}

data "terraform_remote_state" "environment_vpc" {
  backend = "s3"

  config = {
    bucket = "${var.tfstate_global_bucket}"
    key    = "environments/${var.account_name}/${var.aws_region}/_vpc/terraform.tfstate"
    region = "${var.tfstate_global_bucket_region}"
  }
}
