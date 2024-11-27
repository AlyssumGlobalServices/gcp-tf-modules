terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

provider "google" {

  project = "swap-demo-441113"
  region  = "europe-west2"
}