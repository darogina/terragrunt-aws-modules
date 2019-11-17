module "aws-config" {
  source = "../aws-config"

  providers = {
    aws.ap-northeast-1 = aws.ap-northeast-1
    aws.ap-northeast-2 = aws.ap-northeast-2
    aws.ap-south-1     = aws.ap-south-1
    aws.ap-southeast-1 = aws.ap-southeast-1
    aws.ap-southeast-2 = aws.ap-southeast-2
    aws.ca-central-1   = aws.ca-central-1
    aws.eu-central-1   = aws.eu-central-1
    aws.eu-north-1     = aws.eu-north-1
    aws.eu-west-1      = aws.eu-west-1
    aws.eu-west-2      = aws.eu-west-2
    aws.eu-west-3      = aws.eu-west-3
    aws.sa-east-1      = aws.sa-east-1
    aws.us-east-1      = aws.us-east-1
    aws.us-east-2      = aws.us-east-2
    aws.us-west-1      = aws.us-west-1
    aws.us-west-2      = aws.us-west-2
  }

  account_id            = data.aws_caller_identity.current.account_id
  account_name          = "Master"
  audit_logs_bucket_arn = aws_s3_bucket.audit_logs.arn
  audit_logs_bucket_id  = aws_s3_bucket.audit_logs.id
  region                = var.aws_region
}

data "aws_iam_policy_document" "config_organisation_assume_role_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "config_organisation_aggregator" {
  name               = "MasterAWSConfigAggregatorRole"
  assume_role_policy = data.aws_iam_policy_document.config_organisation_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "config_organisation_aggregator" {
  role       = aws_iam_role.config_organisation_aggregator.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}

resource "aws_config_configuration_aggregator" "organisation" {
  name = "master-aggregator"

  organization_aggregation_source {
    all_regions = true
    role_arn    = aws_iam_role.config_organisation_aggregator.arn
  }
}
