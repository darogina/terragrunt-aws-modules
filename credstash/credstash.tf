module "credstash" {
  source = "git::git@github.com:fpco/terraform-aws-foundation//modules/credstash-setup?ref=v0.9.7"

  enable_key_rotation  = true
  create_reader_policy = true
  create_writer_policy = true
}
