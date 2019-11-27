module "assume_role_terraform_administrator" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "master"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "TerraformAdministrator"
  role_policy_arn         = "${var.administrator_default_arn}"
}

data "aws_iam_policy_document" "terraform_data_administrator" {
  statement {
    sid = "AllowListAllS3Buckets"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AllowS3ActionsOnTerraformBucket"

    actions = [
      "s3:CreateBucket",
      "s3:ListBucket",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning",
      "s3:GetBucketTagging",
      "s3:PutBucketTagging",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}",
    ]
  }

  statement {
    sid = "AllowGetAndPutS3ActionsOnTerraformBucketPath"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}/*",
    ]
  }

  statement {
    sid = "AllowCreateAndUpdateDynamoDBActionsOnTerraformLockTable"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:CreateTable",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/${var.tfstate_global_dynamodb}",
    ]
  }

  statement {
    sid = "AllowTagAndUntagDynamoDBActions"

    actions = [
      "dynamodb:TagResource",
      "dynamodb:UntagResource",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "terraform_data_administrator" {
  name        = "TerraformDataAdministratorAccess"
  policy      = data.aws_iam_policy_document.terraform_data_administrator.json
  description = "Grants permissions to manage Terraform remote state"
}

module "assume_role_terraform_data_administrator" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "master"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "TerraformDataAdministrator"
  role_policy_arn         = "${aws_iam_policy.terraform_data_administrator.arn}"
}

data "aws_iam_policy_document" "terraform_data_reader" {
  statement {
    sid = "AllowListAllS3Buckets"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AllowListS3ActionsOnTerraformBucket"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}",
    ]
  }

  statement {
    sid = "AllowGetS3ActionsOnTerraformBucketPath"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.tfstate_global_bucket}/*",
    ]
  }
}

resource "aws_iam_policy" "terraform_data_reader" {
  name        = "TerraformDataReaderAccess"
  policy      = data.aws_iam_policy_document.terraform_data_reader.json
  description = "Grants permissions to read Terraform remote state"
}

module "assume_role_terraform_data_reader" {
  source = "../utility/iam/create-role-with-assume"

  account_name            = "master"
  account_id              = "${data.aws_caller_identity.current.account_id}"
  assume_role_policy_json = "${data.aws_iam_policy_document.crossaccount_assume_from_master.json}"
  role                    = "TerraformDataReader"
  role_policy_arn         = "${aws_iam_policy.terraform_data_reader.arn}"
}
