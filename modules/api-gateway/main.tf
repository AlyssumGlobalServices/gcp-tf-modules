resource "google_project_service" "enable_services" {
  for_each = toset([
    "apigateway.googleapis.com",
    "cloudfunctions.googleapis.com",
    "iam.googleapis.com",
    "servicemanagement.googleapis.com"
  ])
  service = each.key
  project = var.project_id
}
resource "google_api_gateway_api" "api_gw" {
  depends_on = [google_project_service.enable_services]
  provider   = google-beta
  api_id     = var.api_id
}

resource "google_api_gateway_api_config" "api_cfg" {
  depends_on    = [google_project_service.enable_services]
  provider      = google-beta
  api           = google_api_gateway_api.api_gw.api_id
  api_config_id = var.api_config_id

  openapi_documents {
    document {
      path     = "openSpec.yaml"
      contents = filebase64("${path.module}/openSpec.yaml")
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "gw" {
  depends_on = [
    google_api_gateway_api_config.api_cfg,
    google_project_service.enable_services
  ]
  provider   = google-beta
  api_config = google_api_gateway_api_config.api_cfg.id
  gateway_id = var.gateway_id

}
