resource "google_project_service" "project" {
  for_each = toset([
    "dataproc.googleapis.com",
  ])

  service = each.key

  disable_on_destroy = false
}