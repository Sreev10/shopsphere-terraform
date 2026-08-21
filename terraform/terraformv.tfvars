project_id   = "gke-project-1-500610"
project_name = "shopsphere"
region       = "asia-south1"
zone         = "asia-south1-a"
environment  = "dev"
owner        = "sreevastava"

# subnets cidr
public_subnet_cidr     = "10.10.1.0/24"
private_subnet_cidr    = "10.10.2.0/24"
database_subnet_cidr   = "10.10.3.0/24"
management_subnet_cidr = "10.10.4.0/24"
pods_subnet_cidr       = "10.20.0.0/16"
services_subnet_cidr   = "10.30.0.0/20"

# bastion 
admin_cidr = ["124.123.136.182/32", "49.204.27.174/32"]

# monitoring

notification_email = "sreevastava0@gmail.com"