provider "vault" {
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend            = "${vault_auth_backend.kubernetes.path}"
  kubernetes_ca_cert = file("ca.crt")
  kubernetes_host    = "https://192.168.65.3:6443"
}

resource "vault_kubernetes_auth_backend_role" "demo" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "demo"
  bound_service_account_names      = ["demo"]
  bound_service_account_namespaces = ["vault"]
  token_ttl                        = 3600
  token_policies                   = ["default", "demo"]
}

data "vault_policy_document" "demo" {
  rule {
    path         = "kv/demo"
    capabilities = ["read", "list"]
    description  = "allow read access to /kv/demo"
  }
  rule {
    path         = "kv"
    capabilities = ["list"]
    description  = "allow read access to /kv/demo"
  }
}

resource "vault_policy" "demo" {
  name   = "demo"
  policy = "${data.vault_policy_document.demo.hcl}"
}

