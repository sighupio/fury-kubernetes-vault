variable "kubernetes_ca_cert" {
  default = "ca.crt"
}

variable "kubernetes_host" {
  default = "https://192.168.65.3:6443"
}

variable "policies_auth_role" {
  type = list(object({
    name             = string
    service_accounts = list(string)
    namespaces       = list(string)
    policies         = list(string)
    ttl              = number
  }))
  default = []
}
