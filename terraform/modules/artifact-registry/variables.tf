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
variable "repository_name" {
  description = "The name of the artifact registry repository"
  type        = string
  default     = "shopsphere"
}
variable "format" {
  description = "The format of the artifact registry repository"
  type        = string
  default     = "DOCKER"
}
