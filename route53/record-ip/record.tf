resource "aws_route53_record" "dns_record" {
  zone_id = var.route53_zone_id
  name    = var.record_dns
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.target_hosts
}
