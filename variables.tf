variable "project_id" {
  description = "Google Cloud project that owns the workload identity service account."
  type        = string
}

variable "access_token" {
  description = "Optional Google access token for authenticated operations."
  type        = string
  default     = null
  sensitive   = true
}

variable "create_resources" {
  description = "Whether to create the Google service account and IAM binding. Set false for credential-free validation."
  type        = bool
  default     = true
}

variable "service_account_id" {
  description = "Account ID for the Google service account used by the workload."
  type        = string
  default     = "opendepot-gke"
}

variable "service_account_display_name" {
  description = "Display name for the Google service account."
  type        = string
  default     = "OpenDepot GKE workload identity"
}

variable "kubernetes_namespace" {
  description = "Kubernetes namespace that can impersonate the Google service account."
  type        = string
  default     = "opendepot"
}

variable "kubernetes_service_account" {
  description = "Kubernetes service account that can impersonate the Google service account."
  type        = string
  default     = "opendepot-server"
}

