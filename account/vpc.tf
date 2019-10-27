provider "aws" {
  alias = "assume_account"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/OrganizationAccountAccessRole"
  }
}

module "harden_default_vpc" {
  source = "../utility/harden-default-vpc-in-all-regions"

  providers = {
    aws = "aws.assume_account"
  }

  account_name                     = "${var.account_name}"
  vpc_flow_logs_publisher_role_arn = "${data.terraform_remote_state.master.outputs.vpc_flow_logs_publisher_role_arn}"
}
