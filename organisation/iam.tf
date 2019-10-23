module "iam_baseline" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/iam-baseline?ref=0.16.1"

  aws_account_id                 = data.aws_caller_identity.current.account_id
  manager_iam_role_name          = "MasterIamManagerRole"
  manager_iam_role_policy_name   = "IamManager"
  master_iam_role_name           = "MasterIamMasterRole"
  master_iam_role_policy_name    = "IamMaster"
  support_iam_role_name          = "MasterIamSupportRole"
  support_iam_role_policy_name   = "IamSupport"
  support_iam_role_principal_arn = aws_iam_user.support_user.arn
  tags                           = {}
}
