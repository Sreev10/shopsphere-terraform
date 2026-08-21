resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  location                    = var.location
  project                     = var.project_id
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = false
  versioning {
    enabled = true
  }
  public_access_prevention = "enforced"
  labels = {
    environment = var.environment
    project     = "shopsphere"
    managed_by  = "terraform"
  }
}
