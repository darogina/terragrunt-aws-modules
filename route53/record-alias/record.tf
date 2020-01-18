resource "aws_route53_record" "dns_record" {
  zone_id = var.route53_zone_id
  name    = var.record_dns
  type    = "A"

  alias {
    name                   = var.target_host
    zone_id                = var.alias_zone_id
    evaluate_target_health = true
  }
}
