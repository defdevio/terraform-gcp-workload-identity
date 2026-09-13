resource "google_service_account" "this" {
  count        = var.create_resources ? 1 : 0
  project      = var.project_id
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_service_account_iam_member" "workload_identity" {
  count              = var.create_resources ? 1 : 0
  service_account_id = google_service_account.this[0].name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.kubernetes_namespace}/${var.kubernetes_service_account}]"
}

resource "google_project_iam_member" "project_roles" {
  for_each = var.create_resources ? var.project_roles : toset([])
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.this[0].email}"
}

