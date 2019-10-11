output "cloudtrail_bucket_id" {
  value = "${aws_s3_bucket.cloudtrail.id}"
}

output "master_account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "master_billing_role_policy_arn" {
  value = "${module.assume_role_policy_master_billing.policy_arn}"
}

output "terragrunt_admin_policy_arn" {
  value = "${aws_iam_policy.terragrunt_admin.arn}"
}

output "terragrunt_admin_role_policy_arn" {
  value = "${module.assume_role_policy_terragrunt_admin.policy_arn}"
}

output "terragrunt_reader_policy_arn" {
  value = "${aws_iam_policy.terragrunt_reader.arn}"
}

output "terragrunt_reader_role_policy_arn" {
  value = "${module.assume_role_policy_terragrunt_reader.policy_arn}"
}
