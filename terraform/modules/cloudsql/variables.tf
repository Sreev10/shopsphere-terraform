variable "project_id" {
  description = "The project ID of cloud project"
  type        = string
}
variable "project_name" {
  description = "The project name of cloud project"
  type        = string
}
variable "environment" {
  description = "The environment of cloud project"
  type        = string
}
variable "region" {
  description = "The region of cloud project"
  type        = string
}
variable "database_name" {
  description = "The name of the cloud sql database"
  type        = string
}
variable "network_id" {
  description = "The network ID of the cloud sql database"
  type        = string
}
variable "database_version" {
  description = "The version of the cloud sql database"
  type        = string
}
variable "tier" {
  description = "The tier of the cloud sql database"
  type        = string
}
variable "instance_name" {
  description = "The name of the cloud sql database instance"
  type        = string
}