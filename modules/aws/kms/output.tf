output "vault_autounseal_conf" {
  value = <<EOF
seal "awskms" {
  region     = "${var.region}"
  access_key = "${aws_iam_access_key.kms_k8s_vault.id}"
  secret_key = "${aws_iam_access_key.kms_k8s_vault.secret}"
  kms_key_id = "${aws_kms_key.kms_k8s_vault.key_id}"
}
EOF
}
