module "storage" {
  source      = "./modules/storage"
  project_id  = var.project_id
  environment = var.environment
  location    = var.region
  bucket_name = "${var.environment}-${var.project_name}-storage"
  depends_on  = [google_project_service.services["storage.googleapis.com"]]
}