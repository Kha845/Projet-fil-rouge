resource "kubernetes_deployment" "mydb-deployment" {
  metadata {
    name = "mydb-deployment"
    labels = {
      app = "mysql"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = "kha458/mysql-7.8:01"
          name  = "database"
        }
      }
    }
  }
}




