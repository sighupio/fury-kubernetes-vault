pid_file = "./pidfile"

vault {
}

auto_auth {
  method "kubernetes" {
    config = {
      role= "demo"
    }
  }
}

cache {
        use_auto_auth_token = true
}

listener "tcp" {
         address = "127.0.0.1:8200"
         tls_disable = true
}

