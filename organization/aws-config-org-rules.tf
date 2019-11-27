resource "aws_config_organization_managed_rule" "iam_mfa" {
  name            = "IAMAccountMFAEnabled"
  rule_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS"

  depends_on = [
    module.aws-config
  ]
}

resource "aws_config_organization_managed_rule" "unused_credentials" {
  name            = "UnusedCredentialsNotExist"
  rule_identifier = "IAM_USER_UNUSED_CREDENTIALS_CHECK"

  input_parameters = "{\"maxCredentialUsageAge\": \"90\"}"

  depends_on = [
    module.aws-config
  ]
}

resource "aws_config_organization_managed_rule" "user_no_policies" {
  name            = "NoPoliciesAttachedToUser"
  rule_identifier = "IAM_USER_NO_POLICIES_CHECK"

  resource_types_scope = [
    "AWS::IAM::User",
  ]

  depends_on = [
    module.aws-config
  ]
}

resource "aws_config_organization_managed_rule" "no_policies_with_full_admin_access" {
  name            = "NoPoliciesWithFullAdminAccess"
  rule_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_ADMIN_ACCESS"

  resource_types_scope = [
    "AWS::IAM::Policy",
  ]

  depends_on = [
    module.aws-config
  ]
}
