output "vault_backend_conf" {
  value = <<EOF
storage "dynamodb" {
  region     = "${var.region}"
  access_key = "${aws_iam_access_key.vault_dynamodb_backend.id}"
  secret_key = "${aws_iam_access_key.vault_dynamodb_backend.secret}"
  ha_enabled = "true"
  table = "${aws_dynamodb_table.vault-backend.id}"
}
EOF
}
