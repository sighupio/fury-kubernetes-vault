
provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource "aws_kms_key" "kms_k8s_vault" {
  description             = "KMS for Vault AutoSeal ${var.env}"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = merge(var.tags,{
    "Usage" = "Vault"
    "Env"   = var.env
  })
}

resource "aws_kms_alias" "kms_k8s_vault" {
  name          = "alias/${var.name}"
  target_key_id = aws_kms_key.kms_k8s_vault.key_id
}

resource "aws_iam_user" "kms_k8s_vault" {
  name = "kms_k8s_vault_${var.env}"
  path = "/"
}

resource "aws_iam_access_key" "kms_k8s_vault" {
  user = aws_iam_user.kms_k8s_vault.name
}

resource "aws_iam_user_policy" "kms_k8s_vault" {
  name = "policy-${aws_iam_user.kms_k8s_vault.name}-${var.env}"
  user = aws_iam_user.kms_k8s_vault.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kms:DescribeKey",
        "kms:Encrypt",
        "kms:Decrypt"
      ],
      "Effect": "Allow",
      "Resource": [
              "${aws_kms_key.kms_k8s_vault.arn}"
      ]
    }
  ]
}
EOF
}
