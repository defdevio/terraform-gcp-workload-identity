output "service_account_email" { value = try(google_service_account.this[0].email, null) }
output "workload_identity_member" { value = "serviceAccount:${var.project_id}.svc.id.goog[${var.kubernetes_namespace}/${var.kubernetes_service_account}]" }

