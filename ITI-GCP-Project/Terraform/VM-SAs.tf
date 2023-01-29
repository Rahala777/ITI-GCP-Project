resource "google_service_account" "service_account" {
  account_id   = "proj-sa"
  display_name = "Service Account"
}

resource "google_project_iam_member" "vm_sa" {
  project = "omar-yasser-375922"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "vm_sa1" {
  project = "omar-yasser-375922"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}