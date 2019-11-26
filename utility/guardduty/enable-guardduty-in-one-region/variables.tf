variable "finding_publishing_frequency" {
  description = "Specifies the frequency of notifications sent for subsequent finding occurrences."
  default     = "SIX_HOURS"
}

variable "master_account_id" {
  description = "AWS account ID for master account."
  default     = ""
}

variable "master_detector_id" {
  description = "The ID of the GuardDuty detector in the default region of the master account."
  default     = ""
}

variable "member_account_email" {
  description = "AWS email address for member account."
  default     = ""
}
