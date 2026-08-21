output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "public_subnet_name" {
  value = google_compute_subnetwork.public.name
}

output "private_subnet_name" {
  value = google_compute_subnetwork.private.name
}

output "database_subnet_name" {
  value = google_compute_subnetwork.database.name
}

output "management_subnet_name" {
  value = google_compute_subnetwork.management.name
}
output "vpc_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpc.id
}
output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = google_compute_subnetwork.private.id
}