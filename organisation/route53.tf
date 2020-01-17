module "route53_zone" {
  source = "../route53/public-zone"

  domain = "${var.domain}"
}
