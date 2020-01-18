variable "alias_zone_id" {
  description = "The ID of aliased entity zone"
  type        = string
}

variable "record_dns" {
  description = "The DNS record to create"
  type        = string
}

variable "route53_zone_id" {
  description = "The ID of the Route53 zone"
  type        = string
}

variable "target_host" {
  description = "A hosts to associate with the DNS record"
  type        = string
}
