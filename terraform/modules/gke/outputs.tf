output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "cluster_endpoint" {
  value     = google_container_cluster.gke.endpoint
  sensitive = true
}

output "application_node_pool" {
  value = google_container_node_pool.application.name
}

output "system_node_pool" {
  value = google_container_node_pool.system.name
}