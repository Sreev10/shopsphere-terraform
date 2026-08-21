resource "google_artifact_registry_repository" "docker_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.environment}-${var.repository_name}"
  format        = var.format
  description   = "Shopsphere Docker Repository"
  labels = {
    environment = var.environment
    project     = "shopsphere"
    managed_by  = "terraform"
  }
}