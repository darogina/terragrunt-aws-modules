provider "aws" {
  alias = "assume_account"

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/OrganizationAccountAccessRole"
  }
}

module "create_role" {
  source = "../role-create"

  providers = {
    aws = "aws.assume_account"
  }

  account_name            = "${var.account_name}"
  assume_role_policy_json = "${var.assume_role_policy_json}"
  role                    = "${var.role}"
  role_policy_arn         = "${var.role_policy_arn}"
}

module "assume_role" {
  source = "../role-assume"

  account_name            = "${var.account_name}"
  account_id              = "${var.account_id}"
  role                    = "${module.create_role.name}"
}

