output "terraform_sa_email" {
  value = google_service_account.terraform_sa.email
}
output "gke_node_sa_email" {
  value = google_service_account.gke_node_sa.email
}
output "jenkins_sa_email" {
  value = google_service_account.jenkins_sa.email
}
output "cloud_build_sa_email" {
  value = google_service_account.cloud_build_sa.email
}
output "monitoring_sa_email" {
  value = google_service_account.monitoring_sa.email
}
output "gke_node_service_account" {
  description = "GKE node service account email"
  value       = google_service_account.gke_node_sa.email
}
output "jenkins_service_account" {
  description = "Jenkins service account email"
  value       = google_service_account.jenkins_sa.email
}