provider "google" {
  region  = var.region
}

provider "google-beta" {
  region  = var.region
}

resource "random_id" "project_id" {
  byte_length = 4
}

resource "google_project" "project" {
  name = var.project_name
  project_id = "bigdata-procamp-${lower(random_id.project_id.hex)}"
  billing_account = var.billing_account
}

resource "google_project_service" "project" {
  project = google_project.project.project_id

  for_each = toset([
    "dataproc.googleapis.com",
  ])

  service = each.key

  disable_on_destroy = false
}