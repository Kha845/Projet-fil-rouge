resource "kubernetes_deployment" "myphp-deployment" {

  metadata {
    name = "myphp-deployment"
    labels = {
      app = "php"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "php"
      }
    }

    template {
      metadata {
        labels = {
          app = "php"
        }
      }

      spec {
        container {
          image = "kha458/myphpapacheproject-7.8:01"
          name  = "frontend"
        }
      }
    }
  }
}

