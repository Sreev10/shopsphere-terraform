output "vpc_name" {
  value = module.network.vpc_name
}

output "public_subnet_name" {
  value = module.network.public_subnet_name
}

output "private_subnet_name" {
  value = module.network.private_subnet_name
}

output "database_subnet_name" {
  value = module.network.database_subnet_name
}

output "management_subnet_name" {
  value = module.network.management_subnet_name
}

# storage output

output "storage_bucket_name" {
  value = module.storage.bucket_name
}

output "storage_bucket_url" {
  value = module.storage.bucket_url
}

# loadbalancer outputs

output "load_balancer_ip" {
  description = "Global static IP reserved for ShopSphere Load Balancer"
  value       = module.loadbalancer.load_balancer_ip
}

output "load_balancer_ip_name" {
  description = "Global static IP resource name"
  value       = module.loadbalancer.load_balancer_ip_name
}

output "load_balancer_health_check" {
  description = "Load Balancer health check"
  value       = module.loadbalancer.health_check_name
}