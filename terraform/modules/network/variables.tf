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
variable "network_name" {
  description = "The network name of cloud project"
  type        = string
}
variable "name_prefix" {
  description = "The name prefix of cloud project"
  type        = string
}
variable "common_labels" {
  description = "The common labels of cloud project"
  type        = map(string)
}
variable "public_subnet_cidr" {
  description = "The public subnet cidr of cloud project"
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