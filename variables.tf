variable "zone_id" {
  description = "The AWS zone id"
  type        = string
}

variable "github_username" {
  description = "The github username"
  type        = string
}

variable "github_pages_domain" {
  description = "The domain of the user's github pages site"
  type        = string
}

variable "challenge_code" {
  description = "The github pages domain challenge code"
  type        = string
  default     = null
}

variable "ttl" {
  description = "The TTL for DNS records"
  type        = number
  default     = 10800
}
