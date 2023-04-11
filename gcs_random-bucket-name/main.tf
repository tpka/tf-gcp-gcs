
# The simple Terraform code which provisions a Cloud Storage bucket with a random unique name.

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.60.2"
    }
  }
}

provider "google" {
  # Configuration options
  project = "YOUR-PROJECT"
  # https://cloud.google.com/compute/docs/regions-zones
  region = "europe-west4"
  zone   = "europe-west4-c"
}

resource "random_string" "this" {
  length  = 16
  upper   = false
  special = false
  numeric = false
}

resource "google_storage_bucket" "this" {
  name     = random_string.this.result
  location = "europe-west4"
}