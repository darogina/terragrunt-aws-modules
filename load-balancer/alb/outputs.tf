output "alb_id" {
  value = "${aws_lb.alb.id}"
}

output "dns_name" {
  value = "${aws_lb.alb.dns_name}"
}

output "security_group_id" {
  value = "${aws_security_group.alb.id}"
}

output "zone_id" {
  value = "${aws_lb.alb.zone_id}"
}
