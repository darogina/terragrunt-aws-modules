output "kms_key_arn" {
  value = "${module.credstash.kms_key_arn}"
}

output "reader_policy_arn" {
  value = "${module.credstash.reader_policy_arn}"
}

output "writer_policy_arn" {
  value = "${module.credstash.writer_policy_arn}"
}

output "install_snippet" {
  value = "${module.credstash.install_snippet}"
}

output "get_cmd" {
  value = "${module.credstash.get_cmd}"
}

output "put_cmd" {
  value = "${module.credstash.put_cmd}"
}
