# service accounts

resource "google_service_account" "terraform_sa" {
  account_id   = "${var.environment}-terraform-sa"
  display_name = "Terraform Service Account"
  project      = var.project_id
}

# GKE node service account 

resource "google_service_account" "gke_node_sa" {
  account_id   = "${var.environment}-gke-node-sa"
  display_name = "GKE Node Service Account"
  project      = var.project_id
}

#jenkins service account

resource "google_service_account" "jenkins_sa" {
  account_id   = "${var.environment}-jenkins-sa"
  display_name = "Jenkins Service Account"
  project      = var.project_id
}

# cloud build service account
resource "google_service_account" "cloud_build_sa" {
  account_id   = "${var.environment}-cloud-build-sa"
  display_name = "Cloud Build Service Account"
  project      = var.project_id
}

#monitoring service account
resource "google_service_account" "monitoring_sa" {
  account_id   = "${var.environment}-monitoring-sa"
  display_name = "Monitoring Service Account"
  project      = var.project_id
}

# 