output "load_balancer_ip" {
  description = "Global static IP address reserved for ShopSphere Load Balancer"
  value       = google_compute_global_address.load_balancer_ip.address
}

output "load_balancer_ip_name" {
  description = "Name of the global static IP resource"
  value       = google_compute_global_address.load_balancer_ip.name
}

output "health_check_name" {
  description = "HTTP health check name"
  value       = google_compute_health_check.http.name
}