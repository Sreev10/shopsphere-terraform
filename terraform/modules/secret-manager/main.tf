resource "google_secret_manager_secret" "db_password" {
  secret_id = "${var.environment}-db-password"
  project   = var.project_id
  replication {
    auto {

    }
  }
  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }

}

resource "google_secret_manager_secret" "db_username" {
  secret_id = "${var.environment}-db-username"
  project   = var.project_id
  replication {
    auto {

    }
  }
  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }

}

resource "google_secret_manager_secret" "jwt_secret" {
  secret_id = "${var.environment}-jwt-secret"
  project   = var.project_id
  replication {
    auto {

    }
  }
  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }

}