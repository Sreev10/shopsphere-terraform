terraform {
  backend "gcs" {
    bucket = "shopsphere-terraform-state-gke-project-1-500610"
    prefix = "shopsphere/dev"
  }
}