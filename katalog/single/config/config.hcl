listener "tcp" {
    address = "0.0.0.0:8200"
    cluster_address = "0.0.0.0:8201"
    tls_disable = "true"
    telemetry {
      unauthenticated_metrics_access = true
    }
}

telemetry {
  prometheus_retention_time = "30s"
  disable_hostname = true
}

ui = true
cluster_name = "fury-vault"
raw_storage_endpoint = true
