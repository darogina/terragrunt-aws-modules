data "aws_iam_policy_document" "audit_log_policy" {
  statement {
    sid     = "AWSCloudTrailAclCheckForConfig"
    actions = ["s3:GetBucketAcl"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    resources = ["${aws_s3_bucket.audit_logs.arn}"]
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
        "${aws_s3_bucket.audit_logs.arn}/config/AWSLogs/${data.aws_organizations_organization.organisation.id}/Config/*"
      ],
      [
        for account in data.aws_organizations_organization.organisation.non_master_accounts : "${aws_s3_bucket.audit_logs.arn}/config/AWSLogs/${account.id}/Config/*"
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

    resources = ["${aws_s3_bucket.audit_logs.arn}"]
  }

  statement {
    sid     = "AWSCloudTrailWriteForCloudTrail"
    actions = ["s3:PutObject"]

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    resources = concat(
      [
        "${aws_s3_bucket.audit_logs.arn}/cloudtrail/AWSLogs/${data.aws_organizations_organization.organisation.id}/*"
      ],
      [
        for account in data.aws_organizations_organization.organisation.non_master_accounts : "${aws_s3_bucket.audit_logs.arn}/cloudtrail/AWSLogs/${account.id}/*"
      ]
    )

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
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
      resources = [aws_s3_bucket.audit_logs.arn]
    }
  }
}

resource "aws_s3_bucket" "audit_logs" {
  bucket = "${var.audit_logs_bucket_name}"

  acl           = "log-delivery-write"
  force_destroy = false

  lifecycle_rule {
    id      = "auto-archive"
    enabled = true

    transition {
      days          = "60"
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "audit_logs" {
  bucket = aws_s3_bucket.audit_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.audit_logs
  ]
}

resource "aws_s3_bucket_policy" "audit_logs" {
  bucket = aws_s3_bucket.audit_logs.id

  policy = data.aws_iam_policy_document.audit_log_policy.json

  depends_on = [
    aws_s3_bucket.audit_logs,
    aws_s3_bucket_public_access_block.audit_logs,
  ]
}
