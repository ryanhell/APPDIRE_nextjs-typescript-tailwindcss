job nextjs-typescript-tailwindcss {
  datacenters = ["dc1"]

  group nextjs-typescript-tailwindcss {
    count = 1
    task nextjs-typescript-tailwindcss {
      vault {
        policies = ["blockchainr-read-secrets"]
      }
      driver = "docker"
      config {
        image = "acrbc001.azurecr.io/nextjs-typescript-tailwindcss:latest"
        port_map {
          http = 3000
        }
      }
      template {
        data        = <<EOH
          PORT=3000
        EOH
        destination = "secrets/file.env"
        env         = true
      }
  
      resources {
        cpu    = 512
        memory = 1024
        network {
          port "http" {}
          mbits = 10
        }
      }
      service {
        name = "nextjs-typescript-tailwindcss"
        tags = [
          "api",
          "urlprefix-nextjs-typescript-tailwindcss-main.blockchainr.app/"
        ]
        port = "http"
        check {
          name = "alive"
          type = "tcp"
          interval = "10s"
          timeout = "2s"
        }
      }
    }
  }

}