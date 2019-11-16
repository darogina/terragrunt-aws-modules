output "assume_terragrunt_administrator_role_policy_arn" {
  value = "${module.assume_role_terragrunt_administrator.policy_arn}"
}

output "assume_terragrunt_data_administrator_role_policy_arn" {
  value = "${module.assume_role_terragrunt_data_administrator.policy_arn}"
}

output "assume_terragrunt_data_reader_role_policy_arn" {
  value = "${module.assume_role_terragrunt_data_reader.policy_arn}"
}

output "audit_logs_bucket_arn" {
  value = "${module.cloudtrail.audit_logs_bucket_arn}"
}

output "audit_logs_bucket_id" {
  value = "${module.cloudtrail.audit_logs_bucket_id}"
}

output "cloudtrail_bucket_arn" {
  value = "${module.cloudtrail.cloudtrail_bucket_arn}"
}

output "cloudtrail_bucket_id" {
  value = "${module.cloudtrail.cloudtrail_bucket_id}"
}


output "master_account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "master_detector_ids" {
  value = {
    "ap-northeast-1" = "${module.guardduty.detector_ap-northeast-1}"
    "ap-northeast-2" = "${module.guardduty.detector_ap-northeast-2}"
    "ap-south-1"     = "${module.guardduty.detector_ap-south-1}"
    "ap-southeast-1" = "${module.guardduty.detector_ap-southeast-1}"
    "ap-southeast-2" = "${module.guardduty.detector_ap-southeast-2}"
    "ca-central-1"   = "${module.guardduty.detector_ca-central-1}"
    "eu-central-1"   = "${module.guardduty.detector_eu-central-1}"
    "eu-north-1"     = "${module.guardduty.detector_eu-north-1}"
    "eu-west-1"      = "${module.guardduty.detector_eu-west-1}"
    "eu-west-2"      = "${module.guardduty.detector_eu-west-2}"
    "eu-west-3"      = "${module.guardduty.detector_eu-west-3}"
    "sa-east-1"      = "${module.guardduty.detector_sa-east-1}"
    "us-east-1"      = "${module.guardduty.detector_us-east-1}"
    "us-east-2"      = "${module.guardduty.detector_us-east-2}"
    "us-west-1"      = "${module.guardduty.detector_us-west-1}"
    "us-west-2"      = "${module.guardduty.detector_us-west-2}"
  }
}

output "master_billing_role_policy_arn" {
  value = "${module.assume_role_master_billing.policy_arn}"
}

output "terragrunt_data_administrator_policy_arn" {
  value = "${aws_iam_policy.terragrunt_data_administrator.arn}"
}

output "terragrunt_data_reader_policy_arn" {
  value = "${aws_iam_policy.terragrunt_data_reader.arn}"
}

output "vpc_flow_logs_publisher_role_arn" {
  value = "${aws_iam_role.vpc_flow_logs_publisher.arn}"
}
