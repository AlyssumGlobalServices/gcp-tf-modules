variable "project_name" {
  type        = string
  description = "Enter your Project name"
}

variable "environment" {
  type        = string
  description = "Enter your env name"
}

variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy the Cloud Run service"
  type        = string
}

variable "dns_zone_name" {
  description = "DNS managed zone name"
}

# Keycloak variables
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
#keycloack-Domain-mapping
variable "kc_custom_domain" {
  description = "Custom domain for Cloud Run"
}


# Security container variables
variable "security_image" {
  description = "The container image to deploy for the security container"
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

# Firebase variables
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

# Keycloak client variables
variable "KEYCLOAK_CLIENT_ID" {
  description = "Keycloak Client ID"
  type        = string
}

variable "KEYCLOAK_CLIENT_SECRET" {
  description = "Keycloak client secret"
  type        = string
}

variable "KEYCLOAK_AUTH_SERVER_URL" {
  description = "The Keycloak authorization service URL"
  type        = string
}

variable "KEYCLOAK_REALM" {
  description = "Keycloak Realm"
  type        = string
}

# Crypto variables
variable "CRYPTO_SECRET_KEY" {
  description = "Crypto secret key"
  type        = string
}

#Security-domain-mapping
variable "security_custom_domain" {
  description = "Custom domain for Cloud Run"
}


