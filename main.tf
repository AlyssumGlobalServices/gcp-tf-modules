resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

resource "google_cloud_run_service" "service" {
  depends_on = [google_project_service.cloud_run]

  name     = "tf-keycloak"
  location = "europe-west2"
  template {
    spec {
      containers {
        image = "docker.io/keycloak/keycloak:23.0.6"
        ports {
          container_port = 8080
        }
        resources {
          limits = {
            memory = "2048Mi"
            cpu    = "2"
          }
        }
        args = ["start-dev"]
        env {
          name  = "KEYCLOAK_ADMIN"
          value = "admin"
        }
        env {
          name  = "KEYCLOAK_ADMIN_PASSWORD"
          value = "admin"
        }
        env {
          name  = "KC_PROXY"
          value = "edge"
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
  depends_on = [google_cloud_run_service.service]
  service    = google_cloud_run_service.service.name
  location   = google_cloud_run_service.service.location
  role       = "roles/run.invoker"
  member     = "allUsers"
}
