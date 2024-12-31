variable "region" {
  description = "The region to deploy the Cloud Run service"
  type        = string
}

variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "kc_cloud_run_service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "kc_image" {
  description = "The container image to deploy"
  type        = string
}

variable "kc_container_port" {
  description = "The port the container listens on"
  type        = number
}

variable "kc_memory_limit" {
  description = "The memory limit for the container"
  type        = string
}

variable "kc_cpu_limit" {
  description = "The CPU limit for the container"
  type        = string
}

variable "kc_container_args" {
  description = "The arguments to pass to the container"
  type        = list(string)
}

variable "keycloak_admin" {
  description = "Keycloak admin username"
  type        = string
}

variable "keycloak_admin_password" {
  description = "Keycloak admin password"
  type        = string
}

variable "kc_proxy" {
  description = "The Keycloak proxy setting"
  type        = string
}

#Domain
variable "kc_custom_domain" {
  description = "Custom domain for Cloud Run"
}

variable "dns_zone_name" {
  description = "DNS managed zone name"
}

