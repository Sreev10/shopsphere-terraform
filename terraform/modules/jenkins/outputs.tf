output "jenkins_name" {
  description = "Jenkins VM name"
  value       = google_compute_instance.jenkins.name
}

output "jenkins_internal_ip" {
  description = "Jenkins VM internal IP"
  value       = google_compute_instance.jenkins.network_interface[0].network_ip
}

output "jenkins_zone" {
  description = "Jenkins VM zone"
  value       = google_compute_instance.jenkins.zone
}