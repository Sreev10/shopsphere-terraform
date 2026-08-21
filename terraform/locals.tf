locals {
  common_labels = {
    project     = var.project_name
    environmnet = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }
  name_prefix = "${var.project_name}-${var.environment}"
}