module "vpc_baseline_ap-northeast-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ap-northeast-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_ap-northeast-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ap-northeast-2"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_ap-south-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ap-south-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_ap-southeast-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ap-southeast-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_ap-southeast-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ap-southeast-2"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_ca-central-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.ca-central-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_eu-central-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.eu-central-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_eu-north-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.eu-north-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_eu-west-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.eu-west-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_eu-west-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.eu-west-2"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_eu-west-3" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.eu-west-3"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_sa-east-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.sa-east-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_us-east-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.us-east-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_us-east-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.us-east-2"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_us-west-1" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.us-west-1"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}

module "vpc_baseline_us-west-2" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/vpc-baseline?ref=0.16.1"

  providers = {
    aws = "aws.us-west-2"
  }

  vpc_log_group_name         = "${var.account_name}-${var.vpc_log_group_name}"
  vpc_flow_logs_iam_role_arn = "${var.vpc_flow_logs_publisher_role_arn}"
  vpc_log_retention_in_days  = var.vpc_log_retention_in_days

  tags = {}
}
