output "security_cloud_run_service_url" {
  description = "The URL of the deployed security Cloud Run service"
  value       = google_cloud_run_service.sc_service.status[0].url
}