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
variable "environment" {
  description = "The environment of cloud project"
  type        = string
}
variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}
variable "network_id" {
  description = "The network id of cloud project"
  type        = string
}
variable "subnetwork_id" {
  description = "The subnetwork id of cloud project"
  type        = string
}
variable "pods_range_name" {
  description = "The pods range name of cloud project"
  type        = string
}
variable "services_range_name" {
  description = "The services range name of cloud project"
  type        = string
}
variable "node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
  default     = 2
}
variable "node_service_account" {
  description = "Service account used by GKE nodes"
  type        = string
}
