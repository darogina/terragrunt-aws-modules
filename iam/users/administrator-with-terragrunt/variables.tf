variable "admin_email" {
  description = "The email address of the admin user, used as the username"
  type        = string
}

variable "keybase" {
  description = "The keybase profile to encrypt the secret_key"
  type        = string
}
