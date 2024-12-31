# resource "google_project_service" "cloud_run" {
#   service = "run.googleapis.com"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

resource "google_cloud_run_service" "sc_service" {

  name     = var.security_cloud_run_service_name
  location = var.region
  template {
    spec {
      containers {
        image = var.security_image
        ports {
          container_port = var.security_container_port
        }
        resources {
          limits = {
            memory = var.security_container_memory_limit
            cpu    = var.security_container_cpu_limit
          }
        }
        env {
          name  = "KEYCLOAK_CLIENT_ID"
          value = var.KEYCLOAK_CLIENT_ID
        }
        env {
          name  = "KEYCLOAK_CLIENT_SECRET"
          value = var.KEYCLOAK_CLIENT_SECRET
        }
        env {
          name  = "KEYCLOAK_AUTH_SERVER_URL"
          value = var.KEYCLOAK_AUTH_SERVER_URL
        }
        env {
          name  = "KEYCLOAK_REALM"
          value = var.KEYCLOAK_REALM
        }
        env {
          name  = "FIREBASE_CLIENT_EMAIL"
          value = var.FIREBASE_CLIENT_EMAIL
        }
        env {
          name  = "FIREBASE_DATABASE_URL"
          value = var.FIREBASE_DATABASE_URL
        }
        env {
          name  = "FIREBASE_STORAGE_BUCKET_NAME"
          value = var.FIREBASE_STORAGE_BUCKET_NAME
        }
        env {
          name  = "FIREBASE_STORAGE_BUCKET_URL"
          value = var.FIREBASE_STORAGE_BUCKET_URL
        }
        env {
          name  = "FIREBASE_PROJECT_ID"
          value = var.FIREBASE_PROJECT_ID
        }
        env {
          name  = "FIREBASE_PRIVATE_KEY"
          value = var.FIREBASE_PRIVATE_KEY
        }
        env {
          name  = "FIREBASE_API_KEY"
          value = var.FIREBASE_API_KEY
        }
        env {
          name  = "FIREBASE_DATABASE_ID"
          value = var.FIREBASE_DATABASE_ID
        }
        env {
          name  = "CRYPTO_SECRET_KEY"
          value = var.CRYPTO_SECRET_KEY
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
  depends_on = [google_cloud_run_service.sc_service]

  service  = google_cloud_run_service.sc_service.name
  location = google_cloud_run_service.sc_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Map custom domain to Cloud Run
resource "google_cloud_run_domain_mapping" "custom_domain" {
  depends_on = [ google_cloud_run_service.sc_service ]

  location = var.region
  name     = var.security_custom_domain
  
  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = google_cloud_run_service.sc_service.name
  }
  
}

# Create CNAME Record
resource "google_dns_record_set" "aname" {
  depends_on = [ google_cloud_run_domain_mapping.custom_domain ]
  name         = "${var.security_custom_domain}."
  managed_zone = var.dns_zone_name
  type         = "A"
  ttl          = 300
  rrdatas      = [google_cloud_run_domain_mapping.custom_domain.status[0].resource_records[0].rrdata]
}
