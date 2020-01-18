variable "record_dns" {
  description = "The DNS record to create"
  type        = string
}

variable "record_ttl" {
  description = "The TTL to assign to the created record"
  type        = number
  default     = 300
}

variable "record_type" {
  description = "The DNS type to create"
  type        = string
  default     = "A"
}

variable "route53_zone_id" {
  description = "The ID of the Route53 zone"
  type        = string
}

variable "target_hosts" {
  description = "A list of hosts to associate with the DNS records"
  type        = list
}
