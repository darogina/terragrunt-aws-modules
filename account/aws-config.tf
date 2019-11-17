module "aws-config" {
  source = "../aws-config"

  providers = {
    aws                = aws.member
    aws.ap-northeast-1 = aws.member-ap-northeast-1
    aws.ap-northeast-2 = aws.member-ap-northeast-2
    aws.ap-south-1     = aws.member-ap-south-1
    aws.ap-southeast-1 = aws.member-ap-southeast-1
    aws.ap-southeast-2 = aws.member-ap-southeast-2
    aws.ca-central-1   = aws.member-ca-central-1
    aws.eu-central-1   = aws.member-eu-central-1
    aws.eu-north-1     = aws.member-eu-north-1
    aws.eu-west-1      = aws.member-eu-west-1
    aws.eu-west-2      = aws.member-eu-west-2
    aws.eu-west-3      = aws.member-eu-west-3
    aws.sa-east-1      = aws.member-sa-east-1
    aws.us-east-1      = aws.member-us-east-1
    aws.us-east-2      = aws.member-us-east-2
    aws.us-west-1      = aws.member-us-west-1
    aws.us-west-2      = aws.member-us-west-2
  }

  account_id            = "${aws_organizations_account.account.id}"
  account_name          = "${var.account_name}"
  audit_logs_bucket_arn = "${data.terraform_remote_state.master.outputs.audit_logs_bucket_arn}"
  audit_logs_bucket_id  = "${data.terraform_remote_state.master.outputs.audit_logs_bucket_id}"
  region                = "${var.aws_region}"
}
