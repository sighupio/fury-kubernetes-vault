listener "tcp" {
    address = "0.0.0.0:8200"
    cluster_address = "0.0.0.0:8201"
    tls_disable = "true"
}

telemetry {
  statsd_address = "localhost:9125"
}

ui = true
cluster_name = "fury-vault"
raw_storage_endpoint = true
