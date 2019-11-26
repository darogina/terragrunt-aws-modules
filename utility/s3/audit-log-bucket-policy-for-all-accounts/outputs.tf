output "policy" {
  value = "${data.aws_iam_policy_document.audit_log_policy}"
}
