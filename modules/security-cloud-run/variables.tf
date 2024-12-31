variable "region" {
  description = "The region to deploy the security Cloud Run service"
  type        = string
}

variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "security_cloud_run_service_name" {
  description = "The name of the security Cloud Run service"
  type        = string
}

variable "security_image" {
  description = "The container image to deploy for security container"
  type        = string
}

variable "security_container_port" {
  description = "The port the security container listens on"
  type        = number
}

variable "security_container_memory_limit" {
  description = "The memory limit for the security container"
  type        = string
}

variable "security_container_cpu_limit" {
  description = "The CPU limit for the security container"
  type        = string
}


variable "KEYCLOAK_CLIENT_ID" {
  description = "Keycloak Client ID"
  type        = string
}

variable "KEYCLOAK_CLIENT_SECRET" {
  description = "Keycloak client secret"
  type        = string
}

variable "KEYCLOAK_AUTH_SERVER_URL" {
  description = "The Keycloak authorisation service URL"
  type        = string
}

variable "KEYCLOAK_REALM" {
  description = "Keycloak REALM"
  type        = string
}

variable "FIREBASE_DATABASE_URL" {
  description = "Firebase Database URL"
  type        = string
}

variable "FIREBASE_STORAGE_BUCKET_NAME" {
  description = "Firebase storage bucket name"
  type        = string
}

variable "FIREBASE_STORAGE_BUCKET_URL" {
  description = "Firebase storage bucket URL"
  type        = string
}

variable "FIREBASE_PROJECT_ID" {
  description = "Firebase Project ID"
  type        = string
}

variable "FIREBASE_PRIVATE_KEY" {
  description = "Private key for Firebase database"
  type        = string
}

variable "FIREBASE_CLIENT_EMAIL" {
  description = "Firebase client email"
  type        = string
}

variable "FIREBASE_API_KEY" {
  description = "Firebase API key"
  type        = string
}

variable "FIREBASE_DATABASE_ID" {
  description = "Firebase database ID"
  type        = string
}

variable "CRYPTO_SECRET_KEY" {
  description = "Crypto secret key"
  type        = string
}

#Domain
variable "security_custom_domain" {
  description = "Custom domain for Cloud Run"
}

variable "dns_zone_name" {
  description = "DNS managed zone name"
}

