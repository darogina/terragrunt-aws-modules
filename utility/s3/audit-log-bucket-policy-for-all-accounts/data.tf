data "aws_organizations_organization" "organisation" {}

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
        "${var.audit_logs_bucket_arn}/AWSLogs/${data.aws_organizations_organization.organisation.id}/Config/*"
      ],
      [
        for account in data.aws_organizations_organization.organisation.non_master_accounts : "${var.audit_logs_bucket_arn}/AWSLogs/${account.id}/Config/*"
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

  dynamic "statement" {
    for_each = data.aws_organizations_organization.organisation.non_master_accounts[*].id
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
