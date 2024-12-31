output "cloud_run_service_url" {
  description = "The URL of the deployed Cloud Run service"
  value       = module.keycloak_cloud_run.cloud_run_service_url
}

output "security_cloud_run_service_url" {
  description = "The URL of the deployed Security Cloud Run service"
  value       = module.security-cloud_run.security_cloud_run_service_url
}