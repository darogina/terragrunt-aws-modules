resource "aws_organizations_organization" "master" {
  feature_set = "ALL"

  lifecycle {
    prevent_destroy = true
  }
}

module "cross_account_role_organisation_admin" {
  source = "../utility/cross-account-role"

  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "Administrator"
  role_policy_arn         = "arn:aws:iam::aws:policy/AdministratorAccess"
}

module "assume_role_policy_organisation_admin" {
  source = "../utility/assume-role-policy"

  account_name = "master"
  account_id   = "${data.aws_caller_identity.current.account_id}"
  role         = "Administrator"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 10
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 90
}
