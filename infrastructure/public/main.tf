terraform {
  backend "gcs" {
    bucket      = "mmmh-studio-tf-states"
    prefix      = "public"
    credentials = "public-56e58bf0425e.json"
  }
}

provider "google" {
  credentials = file("public-56e58bf0425e.json")
  project     = "public-201022"
  region      = "europe-west3"
  version     = "~> 3.0.0-beta.1"
}

resource "google_dns_managed_zone" "public" {
  name        = "public"
  dns_name    = "mmmh.studio."
  description = "Public zone for web reachable endpoints."
}

resource "google_dns_record_set" "www-cname" {
  type         = "CNAME"
  name         = "www.${google_dns_managed_zone.public.dns_name}"
  managed_zone = google_dns_managed_zone.public.name
  ttl          = 300
  rrdatas      = ["mmmh.studio."]
}

resource "google_dns_record_set" "mx" {
  type         = "MX"
  name         = google_dns_managed_zone.public.dns_name
  managed_zone = google_dns_managed_zone.public.name
  ttl          = 300

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}
