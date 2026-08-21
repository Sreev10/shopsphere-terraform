resource "google_compute_instance" "jenkins" {
  name         = "${var.environment}-jenkins"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
      type  = "pd-balanced"
    }

  }

  network_interface {
    subnetwork = var.management_subnet
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["jenkins"]

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_firewall" "jenkins_ssh" {
  name      = "${var.environment}-allow-jenkins-ssh"
  project   = var.project_id
  network   = var.network_name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags = ["bastion"]
  target_tags = ["jenkins"]
}

resource "google_compute_firewall" "jenkins_http" {
  name      = "${var.environment}-allow-jenkins-http"
  project   = var.project_id
  network   = var.network_name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = [var.management_subnet_cidr]
  target_tags   = ["jenkins"]

}