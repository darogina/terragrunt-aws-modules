data "aws_iam_policy_document" "cloudtrail_bucket_policy" {
  statement {
    sid = "CloudTrailAclCheck"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
    ]

    resources = [
      "arn:aws:s3:::${var.cloudtrail_bucket_name}",
    ]
  }

  statement {
    sid = "CloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.cloudtrail_bucket_name}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}

resource "aws_s3_bucket" "cloudtrail" {
  policy = "${data.aws_iam_policy_document.cloudtrail_bucket_policy.json}"
  bucket = "${var.cloudtrail_bucket_name}"
  acl    = "log-delivery-write"

  force_destroy = false

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  logging {
    target_bucket = aws_s3_bucket.audit_logs.id
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = "90"
    }

    transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "60"
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = "90"
    }

    noncurrent_version_transition {
      days          = "30"
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail" {
  bucket = "${aws_s3_bucket.cloudtrail.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "cloudtrail_baseline" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/cloudtrail-baseline?ref=0.16.1"

  aws_account_id        = data.aws_caller_identity.current.account_id
  iam_role_name         = "MasterCloudtrailCloudWatchDeliveryRole"
  iam_role_policy_name  = "CloudtrailCloudWatchDelivery"
  is_organization_trail = true
  region                = "${var.aws_region}"
  s3_bucket_name        = "${aws_s3_bucket.cloudtrail.id}"
  tags                  = {}
}
