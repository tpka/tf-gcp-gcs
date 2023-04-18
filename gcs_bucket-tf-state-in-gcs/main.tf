
resource "random_id" "bucket_prefix" {
# https://registry.terraform.io/providers/ContentSquare/random/latest/docs/resources/id
  byte_length = 8
}

terraform {
# The bucket need to be existed before running this tf
 backend "gcs" {
   bucket  = "BUCKET-NAME"
   prefix  = "terraform/state" # this will be folder name in the bucket
 }
}

resource "google_storage_bucket" "default" {
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html
# https://cloud.google.com/storage/docs/object-versioning
# https://cloud.google.com/storage/docs/lifecycle
  name          = "bucket-${random_id.bucket_prefix.hex}-tfstate-in-gcs"
  force_destroy = false
  location      = "europe-west4"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}
