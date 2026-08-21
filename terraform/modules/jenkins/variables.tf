variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
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

variable "management_subnet_cidr" {
  description = "Management subnet CIDR"
  type        = string
}

variable "machine_type" {
  description = "Jenkins VM machine type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "Jenkins VM operating system image"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size" {
  description = "Jenkins boot disk size in GB"
  type        = number
  default     = 50
}

variable "service_account_email" {
  description = "Jenkins service account email"
  type        = string
}
