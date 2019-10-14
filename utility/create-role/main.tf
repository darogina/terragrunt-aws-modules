module "create_role" {
  source = "../role-create"

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

