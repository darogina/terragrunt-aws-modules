module "credstash" {
  source = "../credstash"

  providers = {
    aws = aws.member
  }
}
