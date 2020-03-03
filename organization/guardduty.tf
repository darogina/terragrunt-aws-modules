module "guardduty" {
  source = "../guardduty"

  providers = {
    aws.master-ap-northeast-1 = aws.ap-northeast-1
    aws.master-ap-northeast-2 = aws.ap-northeast-2
    aws.master-ap-south-1     = aws.ap-south-1
    aws.master-ap-southeast-1 = aws.ap-southeast-1
    aws.master-ap-southeast-2 = aws.ap-southeast-2
    aws.master-ca-central-1   = aws.ca-central-1
    aws.master-eu-central-1   = aws.eu-central-1
    aws.master-eu-north-1     = aws.eu-north-1
    aws.master-eu-west-1      = aws.eu-west-1
    aws.master-eu-west-2      = aws.eu-west-2
    aws.master-eu-west-3      = aws.eu-west-3
    aws.master-sa-east-1      = aws.sa-east-1
    aws.master-us-east-1      = aws.us-east-1
    aws.master-us-east-2      = aws.us-east-2
    aws.master-us-west-1      = aws.us-west-1
    aws.master-us-west-2      = aws.us-west-2

    aws.member-ap-northeast-1 = aws.ap-northeast-1
    aws.member-ap-northeast-2 = aws.ap-northeast-2
    aws.member-ap-south-1     = aws.ap-south-1
    aws.member-ap-southeast-1 = aws.ap-southeast-1
    aws.member-ap-southeast-2 = aws.ap-southeast-2
    aws.member-ca-central-1   = aws.ca-central-1
    aws.member-eu-central-1   = aws.eu-central-1
    aws.member-eu-north-1     = aws.eu-north-1
    aws.member-eu-west-1      = aws.eu-west-1
    aws.member-eu-west-2      = aws.eu-west-2
    aws.member-eu-west-3      = aws.eu-west-3
    aws.member-sa-east-1      = aws.sa-east-1
    aws.member-us-east-1      = aws.us-east-1
    aws.member-us-east-2      = aws.us-east-2
    aws.member-us-west-1      = aws.us-west-1
    aws.member-us-west-2      = aws.us-west-2
  }
}
