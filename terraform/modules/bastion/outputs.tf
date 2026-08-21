output "bastion_name" {
  description = "Bastion instance name"
  value       = google_compute_instance.bastion.name
}

output "bastion_internal_ip" {
  description = "Bastion internal IP"
  value       = google_compute_instance.bastion.network_interface[0].network_ip
}

output "bastion_external_ip" {
  description = "Bastion external IP"
  value       = google_compute_address.bastion.address
}

output "bastion_zone" {
  description = "Bastion zone"
  value       = google_compute_instance.bastion.zone
}