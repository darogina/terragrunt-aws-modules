data "aws_iam_policy_document" "vpc_flow_logs_publisher_assume_role_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "vpc_flow_logs_publish_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "vpc_flow_logs_publisher" {
  name               = "${var.vpc_iam_role_name}"
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_publisher_assume_role_policy.json
}

resource "aws_iam_role_policy" "vpc_flow_logs_publish_policy" {
  name = "${var.vpc_iam_role_policy_name}"
  role = aws_iam_role.vpc_flow_logs_publisher.id

  policy = data.aws_iam_policy_document.vpc_flow_logs_publish_policy.json
}

module "harden_default_vpc" {
  source = "../utility/harden-default-vpc-in-all-regions"

  account_name                     = "master"
  vpc_flow_logs_publisher_role_arn = "${aws_iam_role.vpc_flow_logs_publisher.arn}"
}
