locals {
  stack_name = "${var.project_name}-${var.environment}"
}

#KEYCLOAK
module "keycloak_cloud_run" {
  source = "../../modules/keycloak-cloud-run"

  region                    = var.region
  project_id                = var.project_id
  kc_cloud_run_service_name = "${local.stack_name}-keycloak"
  kc_image                  = var.kc_image
  kc_container_port         = var.kc_container_port
  kc_memory_limit           = var.kc_memory_limit
  kc_cpu_limit              = var.kc_cpu_limit
  kc_container_args         = var.kc_container_args
  keycloak_admin            = var.keycloak_admin
  keycloak_admin_password   = var.keycloak_admin_password
  kc_proxy                  = var.kc_proxy
  kc_custom_domain          = var.kc_custom_domain
  dns_zone_name             = var.dns_zone_name
}

# #API-GATEWAY
# module "api_gateway" {
#   source = "../../modules/api-gateway"

#   depends_on = [module.keycloak_cloud_run]

#   api_config_id = "${local.stack_name}-config"
#   api_id        = "${local.stack_name}-api"
#   gateway_id    = "${local.stack_name}-gateway"
#   project_id    = var.project_id
# }

#SECURITY
module "security-cloud_run" {
  source = "../../modules/security-cloud-run"

  region                          = var.region
  project_id                      = var.project_id
  security_cloud_run_service_name = "${local.stack_name}-security"
  security_image                  = var.security_image
  security_container_port         = var.security_container_port
  security_container_memory_limit = var.security_container_memory_limit
  security_container_cpu_limit    = var.security_container_cpu_limit
  KEYCLOAK_CLIENT_ID              = var.KEYCLOAK_CLIENT_ID
  KEYCLOAK_CLIENT_SECRET          = var.KEYCLOAK_CLIENT_SECRET
  KEYCLOAK_AUTH_SERVER_URL        = var.KEYCLOAK_AUTH_SERVER_URL
  KEYCLOAK_REALM                  = var.KEYCLOAK_REALM
  FIREBASE_DATABASE_URL           = var.FIREBASE_DATABASE_URL
  FIREBASE_STORAGE_BUCKET_NAME    = var.FIREBASE_STORAGE_BUCKET_NAME
  FIREBASE_STORAGE_BUCKET_URL     = var.FIREBASE_STORAGE_BUCKET_URL
  FIREBASE_PROJECT_ID             = var.FIREBASE_PROJECT_ID
  FIREBASE_PRIVATE_KEY            = var.FIREBASE_PRIVATE_KEY
  FIREBASE_CLIENT_EMAIL           = var.FIREBASE_CLIENT_EMAIL
  FIREBASE_API_KEY                = var.FIREBASE_API_KEY
  FIREBASE_DATABASE_ID            = var.FIREBASE_DATABASE_ID
  CRYPTO_SECRET_KEY               = var.CRYPTO_SECRET_KEY

  security_custom_domain          = var.security_custom_domain
  dns_zone_name                   = var.dns_zone_name
}