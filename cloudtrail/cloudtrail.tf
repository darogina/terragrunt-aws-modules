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
