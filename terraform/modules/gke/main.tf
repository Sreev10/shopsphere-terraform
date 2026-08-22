resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  network    = var.network_id
  subnetwork = var.subnetwork_id

  initial_node_count       = 1
  remove_default_node_pool = true
  deletion_protection      = false

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
  master_authorized_networks_config {
    gcp_public_cidrs_access_enabled = false

    cidr_blocks {
      display_name = "bastion-management-subnet"
      cidr_block   = "10.10.4.0/24"
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }

    http_load_balancing {
      disabled = false
    }
  }

  resource_labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }
}

# Nodepool 1 

resource "google_container_node_pool" "application" {
  name       = "${var.cluster_name}-application"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count
  project    = var.project_id
  lifecycle {
    ignore_changes = [node_count]
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = 1
    max_node_count = 4
  }
  node_config {
    machine_type    = "e2-standard-2"
    disk_type       = "pd-standard"
    disk_size_gb    = 50
    image_type      = "COS_CONTAINERD"
    service_account = var.node_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = {
      environment = var.environment
      workload    = "application"
      project     = var.project_name
      managed_by  = "terraform"
    }
    tags = ["${var.environment}-gke-node"]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }

  }
}


# nodepool 2


resource "google_container_node_pool" "system" {
  name       = "${var.cluster_name}-system"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count
  project    = var.project_id
  lifecycle {
    ignore_changes = [node_count]
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
  node_config {
    machine_type    = "e2-standard-2"
    disk_type       = "pd-balanced"
    disk_size_gb    = 50
    image_type      = "COS_CONTAINERD"
    service_account = var.node_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = {
      environment = var.environment
      workload    = "system"
      project     = var.project_name
      managed_by  = "terraform"
    }
    tags = ["${var.environment}-gke-node"]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }

}
