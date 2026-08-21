variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "management_subnet" {
  description = "Management subnet name"
  type        = string
}

variable "machine_type" {
  description = "Bastion machine type"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Boot disk image"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "admin_cidr" {
  description = "CIDR allowed to SSH to the bastion"
  type        = list(string)
}

variable "service_account_email" {
  description = "Service account attached to the bastion"
  type        = string
}