provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

variable "region" {
  default = "eu-west-1"
}

variable "env" {
  default = "demo"
}

module "kms" {
  source = "./vendor/modules/vault/aws/kms"
  env    = var.env
  region = var.region
}

module "dynamo" {
  source         = "./vendor/modules/vault/aws/dynamo"
  env            = var.env
  region         = var.region
  write_capacity = "10"
  read_capacity  = "10"

}

output "vault_backend_conf" {
  value     = module.dynamo.vault_backend_conf
  sensitive = true
}

output "vault_autounseal_conf" {
  value     = module.kms.vault_autounseal_conf
  sensitive = true
}
