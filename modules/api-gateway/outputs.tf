output "api_gateway_id" {
  description = "The ID of the created Google API Gateway"
  value       = google_api_gateway_gateway.gw.id
}