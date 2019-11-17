module "config_baseline_ap-northeast-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ap-northeast-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ap-northeast-1"
}

module "config_baseline_ap-northeast-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ap-northeast-2
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ap-northeast-2"
}

module "config_baseline_ap-south-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ap-south-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ap-south-1"
}

module "config_baseline_ap-southeast-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ap-southeast-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ap-southeast-1"
}

module "config_baseline_ap-southeast-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ap-southeast-2
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ap-southeast-2"
}

module "config_baseline_ca-central-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.ca-central-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "ca-central-1"
}

module "config_baseline_eu-central-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.eu-central-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "eu-central-1"
}

module "config_baseline_eu-north-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.eu-north-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "eu-north-1"
}

module "config_baseline_eu-west-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.eu-west-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "eu-west-1"
}

module "config_baseline_eu-west-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.eu-west-2
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "eu-west-2"
}

module "config_baseline_eu-west-3" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.eu-west-3
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "eu-west-3"
}

module "config_baseline_sa-east-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.sa-east-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "sa-east-1"
}

module "config_baseline_us-east-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.us-east-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "us-east-1"
}

module "config_baseline_us-east-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.us-east-2
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "us-east-2"
}

module "config_baseline_us-west-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.us-west-1
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "us-west-1"
}

module "config_baseline_us-west-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/config-baseline?ref=0.16.1"

  providers = {
    aws = aws.us-west-2
  }

  iam_role_arn                  = aws_iam_role.recorder.arn
  s3_bucket_name                = var.audit_logs_bucket_id
  s3_key_prefix                 = "config"
  include_global_resource_types = var.region == "us-west-2"
}
