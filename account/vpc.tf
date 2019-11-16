module "harden_default_vpc" {
  source = "../utility/harden-default-vpc-in-all-regions"

  providers = {
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

  account_name                     = "${var.account_name}"
  vpc_flow_logs_publisher_role_arn = "${data.terraform_remote_state.master.outputs.vpc_flow_logs_publisher_role_arn}"
}
