resource "google_compute_address" "bastion" {
  name   = "${var.environment}-bastion-ip"
  region = var.region
}

resource "google_compute_instance" "bastion" {
  name         = "${var.environment}-bastion"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
      size  = 20
      type  = "pd-balanced"
    }
  }
  network_interface {
    subnetwork = var.management_subnet
    access_config {
      nat_ip = google_compute_address.bastion.address
    }
  }
  metadata = {
    enable-oslogin = "TRUE"
  }
  tags = ["bastion"]
  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_firewall" "bastion_ssh" {
  name      = "${var.environment}-allow-bastion-ssh"
  network   = var.network_name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]

  }

  source_ranges = var.admin_cidr
  target_tags   = ["bastion"]

}