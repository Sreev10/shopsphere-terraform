resource "google_sql_database_instance" "mysql" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  project             = var.project_id
  deletion_protection = false

  settings {
    tier              = var.tier
    availability_type = "REGIONAL"
    disk_type         = "PD_SSD"
    disk_size         = 50
    disk_autoresize   = true
    backup_configuration {
      enabled                        = true
      start_time                     = "03:00"
      location                       = var.region
      point_in_time_recovery_enabled = true
    }


    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/gke-project-1-500610/global/networks/shopsphere-dev-vpc"
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
    user_labels = {
      environment = var.environment
      project     = "shopsphere"
      managed_by  = "terraform"
    }
  }

}

resource "google_sql_database" "mysql" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql.name
  project  = var.project_id
}