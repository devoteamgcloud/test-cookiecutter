# This file is used to initialize the deployment

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "sandboxdsd"
}

resource "google_cloud_run_service" "frontend_service" {
  name     = "vuejs-template"
  location = "europe-west9"

  template {
    spec {
      containers {
        image = "europe-docker.pkg.dev/sandboxdsd/cookiecutter-template/vuejs-template"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.frontend_service.location
  project  = google_cloud_run_service.frontend_service.project
  service  = google_cloud_run_service.frontend_service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_secret_manager_secret" "frontend_secret" {
  secret_id = "vuejs-template"

  replication {
    automatic = true
  }
}
