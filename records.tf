locals {
  github_ipv4_addresses = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]

  github_ipv6_addresses = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153"
  ]
}

resource "cloudflare_record" "github_pages_a" {
  for_each  = toset(local.github_ipv4_addresses)

  zone_id = var.zone_id
  name    = "@"
  type    = "A"
  ttl     = var.ttl
  value   = each.value
}

resource "cloudflare_record" "github_pages_aaaa" {
  for_each = toset(local.github_ipv6_addresses)

  zone_id = var.zone_id
  name    = "@"
  type    = "AAAA"
  ttl     = var.ttl
  value   = each.value
}

resource "cloudflare_record" "github_pages_www" {
  zone_id = var.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = var.ttl
  value   = var.github_pages_domain
}

resource "cloudflare_record" "github_pages_challenge_txt" {
  count = var.challenge_code == null ? 0 : 1

  zone_id = var.zone_id
  name    = "_github-pages-challenge-${var.github_username}"
  type    = "TXT"
  ttl     = var.ttl
  value = var.challenge_code
}
