# resource "google_project_service" "cloud_run" {
#   service = "run.googleapis.com"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

resource "google_cloud_run_service" "kc_service" {

  name     = var.kc_cloud_run_service_name
  location = var.region
  metadata {
    namespace = var.project_id
  }

  template {
    spec {
      containers {
        image = var.kc_image
        ports {
          container_port = var.kc_container_port
        }
        resources {
          limits = {
            memory = var.kc_memory_limit
            cpu    = var.kc_cpu_limit
          }
        }
        args = var.kc_container_args
        env {
          name  = "KEYCLOAK_ADMIN"
          value = var.keycloak_admin
        }
        env {
          name  = "KEYCLOAK_ADMIN_PASSWORD"
          value = var.keycloak_admin_password
        }
        env {
          name  = "KC_PROXY"
          value = var.kc_proxy
        }
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "allow_unauthenticated" {
  depends_on = [google_cloud_run_service.kc_service]
  service    = google_cloud_run_service.kc_service.name
  location   = google_cloud_run_service.kc_service.location
  role       = "roles/run.invoker"
  member     = "allUsers"
}

# Map custom domain to Cloud Run
resource "google_cloud_run_domain_mapping" "custom_domain" {
  depends_on = [ google_cloud_run_service.kc_service ]

  location = var.region
  name     = var.kc_custom_domain

  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = google_cloud_run_service.kc_service.name
  }
  
}

# Create CNAME Record
resource "google_dns_record_set" "aname" {
  depends_on = [ google_cloud_run_domain_mapping.custom_domain ]
  name         = "${var.kc_custom_domain}."
  managed_zone = var.dns_zone_name
  type         = "A"
  ttl          = 300
  rrdatas      = [google_cloud_run_domain_mapping.custom_domain.status[0].resource_records[0].rrdata]
}
