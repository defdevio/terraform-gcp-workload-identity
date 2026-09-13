variable "project_id" { type = string }
variable "access_token" {
  type      = string
  default   = null
  sensitive = true
}
variable "create_resources" {
  type    = bool
  default = true
}
variable "service_account_id" {
  type    = string
  default = "opendepot-gke"
}
variable "service_account_display_name" {
  type    = string
  default = "OpenDepot GKE workload identity"
}
variable "kubernetes_namespace" {
  type    = string
  default = "opendepot"
}
variable "kubernetes_service_account" {
  type    = string
  default = "opendepot-server"
}
variable "project_roles" {
  type    = set(string)
  default = ["roles/storage.objectAdmin"]
}

