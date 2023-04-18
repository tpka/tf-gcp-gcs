
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.61.0"
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
