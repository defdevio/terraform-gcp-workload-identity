output "service_account_email" {
  description = "Email of the workload identity Google service account, or null when resources are disabled."
  value       = try(google_service_account.this[0].email, null)
}

output "workload_identity_member" {
  description = "IAM member identifier for the Kubernetes service account."
  value       = "serviceAccount:${var.project_id}.svc.id.goog[${var.kubernetes_namespace}/${var.kubernetes_service_account}]"
}

