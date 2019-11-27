data "aws_organizations_organization" "organization" {}

data "aws_iam_policy_document" "audit_log_policy" {
  depends_on = [null_resource.depends_on]

  statement {
    sid     = "AWSCloudTrailAclCheckForConfig"
    actions = ["s3:GetBucketAcl"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    resources = ["${var.audit_logs_bucket_arn}"]
  }

  statement {
    sid     = "AWSCloudTrailWriteForConfig"
    actions = ["s3:PutObject"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    resources = concat(
      [
        "${var.audit_logs_bucket_arn}/AWSLogs/${data.aws_organizations_organization.organization.id}/Config/*"
      ],
      [
        for account in data.aws_organizations_organization.organization.non_master_accounts : "${var.audit_logs_bucket_arn}/AWSLogs/${account.id}/Config/*"
      ]
    )

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    sid     = "AWSCloudTrailAclCheckForCloudTrail"
    actions = ["s3:GetBucketAcl"]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    resources = ["${var.audit_logs_bucket_arn}"]
  }

  statement {
    sid     = "AWSALBWriteAccessLogs"
    actions = ["s3:PutObject"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::127311923021:root", # us-east-1
        "arn:aws:iam::033677994240:root", # us-east-2
        "arn:aws:iam::027434742980:root", # us-west-1
        "arn:aws:iam::797873946194:root", # us-west-2
        "arn:aws:iam::985666609251:root", # ca-central-1
        "arn:aws:iam::054676820928:root", # eu-central-1
        "arn:aws:iam::156460612806:root", # eu-west-1
        "arn:aws:iam::652711504416:root", # eu-west-2
        "arn:aws:iam::009996457667:root", # eu-west-3
        "arn:aws:iam::897822967062:root", # eu-north-1
        "arn:aws:iam::754344448648:root", # ap-east-1
        "arn:aws:iam::582318560864:root", # ap-northeast-1
        "arn:aws:iam::600734575887:root", # ap-northeast-2
        "arn:aws:iam::383597477331:root", # ap-northeast-3
        "arn:aws:iam::114774131450:root", # ap-southeast-1
        "arn:aws:iam::783225319266:root", # ap-southeast-2
        "arn:aws:iam::718504428378:root", # ap-south-1
        "arn:aws:iam::076674570225:root", # me-south-1
        "arn:aws:iam::507241528517:root"  # sa-east-1
      ]
    }

    resources = ["${var.audit_logs_bucket_arn}/alb/*"]
  }

  dynamic "statement" {
    for_each = data.aws_organizations_organization.organization.non_master_accounts[*].id
    iterator = account_id

    content {
      principals {
        type = "AWS"
        identifiers = [
          "arn:aws:iam::${account_id.value}:root"
        ]
      }
      actions = [
        "s3:GetBucketLocation",
        "s3:ListBucket"
      ]
      resources = [var.audit_logs_bucket_arn]
    }
  }
}
