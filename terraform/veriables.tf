variable "project_id" {
  description = "The project ID of cloud project"
  type        = string
}

variable "project_name" {
  description = "The project name of cloud project"
  type        = string
}

variable "region" {
  description = "The region of cloud project"
  type        = string
}

variable "zone" {
  description = "The zone of cloud project"
  type        = string
}
variable "environment" {
  description = "The environment of cloud project"
  type        = string
}

variable "owner" {
  description = "The owner of cloud project"
  type        = string
}

# subnets cidr 

variable "public_subnet_cidr" {
  description = "The subnet cidr of cloud project"
  type        = string
}
variable "private_subnet_cidr" {
  description = "The private subnet cidr of cloud project"
  type        = string
}
variable "database_subnet_cidr" {
  description = "The database subnet cidr of cloud project"
  type        = string
}
variable "management_subnet_cidr" {
  description = "The management subnet cidr of cloud project"
  type        = string
}
variable "pods_subnet_cidr" {
  description = "The pods subnet cidr of cloud project"
  type        = string
}
variable "services_subnet_cidr" {
  description = "The services subnet cidr of cloud project"
  type        = string
}

variable "admin_cidr" {
  description = "CIDR range allowed to SSH to the bastion host"
  type        = list(string)
}

variable "notification_email" {
  type        = string
  description = "Email address for monitoring alerts"
}