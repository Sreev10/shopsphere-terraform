module "network" {
  source                 = "./modules/network"
  project_id             = var.project_id
  project_name           = var.project_name
  region                 = var.region
  network_name           = local.name_prefix
  name_prefix            = local.name_prefix
  common_labels          = local.common_labels
  public_subnet_cidr     = var.public_subnet_cidr
  private_subnet_cidr    = var.private_subnet_cidr
  database_subnet_cidr   = var.database_subnet_cidr
  management_subnet_cidr = var.management_subnet_cidr
  pods_subnet_cidr       = var.pods_subnet_cidr
  services_subnet_cidr   = var.services_subnet_cidr
}

# iam main.tf 

module "iam" {
  source       = "./modules/iam"
  project_id   = var.project_id
  project_name = var.project_name
  environment  = var.environment
}

# artifact registry main.tf

module "artifact_registry" {
  source       = "./modules/artifact-registry"
  project_id   = var.project_id
  project_name = var.project_name
  environment  = var.environment
  region       = var.region
}

#cloudsql main.tf

locals {
  cloudsql_database_name    = "ecommerce"
  cloudsql_database_version = "POSTGRES_15"
  cloudsql_instance_name    = "${local.name_prefix}-db"
  cloudsql_tier             = "db-f1-micro"
}

#cloudsql module

module "cloudsql" {
  source           = "./modules/cloudsql"
  project_id       = var.project_id
  project_name     = var.project_name
  region           = var.region
  environment      = var.environment
  database_name    = local.cloudsql_database_name
  database_version = local.cloudsql_database_version
  tier             = local.cloudsql_tier
  instance_name    = local.cloudsql_instance_name
  network_id       = module.network.vpc_id
  depends_on       = [module.network]
}


# GKE cluster 

# GKE module

module "gke" {
  source = "./modules/gke"

  project_id   = var.project_id
  project_name = var.project_name
  region       = var.region
  environment  = var.environment

  cluster_name = "${local.name_prefix}-gke"

  network_id    = module.network.vpc_id
  subnetwork_id = module.network.private_subnet_id

  pods_range_name     = "gke-pods"
  services_range_name = "gke-services"

  node_service_account = module.iam.gke_node_service_account

  node_count = 2

  depends_on = [
    google_project_service.services,
    module.network,
    module.iam
  ]
}

# secret manager main.tf 

module "secret_manager" {
  source       = "./modules/secret-manager"
  project_id   = var.project_id
  environment  = var.environment
  project_name = var.project_name

}


# bastion main.tf file

module "bastion" {
  source                = "./modules/bastion"
  project_id            = var.project_id
  environment           = var.environment
  region                = var.region
  zone                  = var.zone
  network_name          = module.network.vpc_name
  management_subnet     = module.network.management_subnet_name
  machine_type          = "e2-micro"
  admin_cidr            = var.admin_cidr
  service_account_email = module.iam.terraform_sa_email

}


# loadbalancer main.tf file

module "loadbalancer" {
  source      = "./modules/loadbalancer"
  project_id  = var.project_id
  environment = var.environment

}


# jenkins main.tf file

module "jenkins" {
  source                 = "./modules/jenkins"
  project_id             = var.project_id
  environment            = var.environment
  zone                   = var.zone
  network_name           = module.network.vpc_name
  management_subnet      = module.network.management_subnet_name
  management_subnet_cidr = var.management_subnet_cidr
  machine_type           = "e2-medium"
  boot_disk_size         = 50
  service_account_email  = module.iam.jenkins_service_account
  depends_on = [
    module.network,
    module.iam
  ]
}

# monitoring main.tf file

module "monitoring" {
  source             = "./modules/monitoring"
  project_id         = var.project_id
  environment        = var.environment
  notification_email = var.notification_email
}


# logging main.tf file

module "logging" {
  source      = "./modules/logging"
  project_id  = var.project_id
  environment = var.environment
}