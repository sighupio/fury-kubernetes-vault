provider "vault" {
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend            = "${vault_auth_backend.kubernetes.path}"
  kubernetes_ca_cert = file(var.kubernetes_ca_cert)
  kubernetes_host    = var.kubernetes_host
}

resource "vault_kubernetes_auth_backend_role" "roles" {
  count                            = length(var.policies_auth_role)
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = var.policies_auth_role[count.index].name
  bound_service_account_names      = var.policies_auth_role[count.index].service_accounts
  bound_service_account_namespaces = var.policies_auth_role[count.index].namespaces
  token_ttl                        = var.policies_auth_role[count.index].ttl
  token_policies                   = var.policies_auth_role[count.index].policies
}
