locals {
  config_topics = [
    module.config_baseline_ap-northeast-1.config_sns_topic,
    module.config_baseline_ap-northeast-2.config_sns_topic,
    module.config_baseline_ap-south-1.config_sns_topic,
    module.config_baseline_ap-southeast-1.config_sns_topic,
    module.config_baseline_ap-southeast-2.config_sns_topic,
    module.config_baseline_ca-central-1.config_sns_topic,
    module.config_baseline_eu-central-1.config_sns_topic,
    module.config_baseline_eu-north-1.config_sns_topic,
    module.config_baseline_eu-west-1.config_sns_topic,
    module.config_baseline_eu-west-2.config_sns_topic,
    module.config_baseline_eu-west-3.config_sns_topic,
    module.config_baseline_sa-east-1.config_sns_topic,
    module.config_baseline_us-east-1.config_sns_topic,
    module.config_baseline_us-east-2.config_sns_topic,
    module.config_baseline_us-west-1.config_sns_topic,
    module.config_baseline_us-west-2.config_sns_topic,
  ]
}

data "aws_iam_policy_document" "recorder_assume_role_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "recorder" {
  name               = "Assume${title(var.account_name)}ConfigRecorderRole"
  assume_role_policy = data.aws_iam_policy_document.recorder_assume_role_policy.json
}

data "aws_iam_policy_document" "recorder_publish_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${var.audit_logs_bucket_arn}/AWSLogs/${var.account_id}/Config/*"]

    condition {
      test     = "StringLike"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    actions   = ["s3:GetBucketAcl"]
    resources = [var.audit_logs_bucket_arn]
  }

  statement {
    actions = ["sns:Publish"]

    resources = [for topic in local.config_topics : topic.arn if topic != null]
  }
}

resource "aws_iam_role_policy" "recorder_publish_policy" {
  name   = "${title(var.account_name)}ConfigPublisherRole"
  role   = aws_iam_role.recorder.id
  policy = data.aws_iam_policy_document.recorder_publish_policy.json
}

resource "aws_iam_role_policy_attachment" "recorder_read_policy" {
  role       = aws_iam_role.recorder.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}
