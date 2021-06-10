# fury-kubernetes-vault

Fury Kubernetes Vault deployment

## Vault Packages

Following packages are included in Fury Kubernetes Vault katalog:

-   [Vault](katalog/single): Vault is a tool for securely accessing
    secrets. A secret is anything that you want to tightly control
    access to, such as API keys, passwords, or certificates. Version: **1.7.2**

Following packages are included in Fury Kubernetes Vault modules:

-   [aws/dynamo](modules/aws/dynamo): Creates an AWS DynamoDB table with an user
    with permissions to manage the table.
-   [aws/kms](modules/aws/kms): Creates KMS keys with an user with permissions to
    the key to encrypt and decrypt secrets.
-   [vault](modules/vault): Creates some [`vault_kubernetes_auth_backend_role`](https://www.terraform.io/docs/providers/vault/r/kubernetes_auth_backend_role.html) to be used in a Kubernetes cluster.

## Compatibility

| Module Version / Kubernetes Version | 1.14.X | 1.15.X | 1.16.X |
| ----------------------------------- | :----: | :----: | :----: |
| v1.0.0                              |        |        |        |

-   :white_check_mark: Compatible
-   :warning: Has issues
-   :x: Incompatible
