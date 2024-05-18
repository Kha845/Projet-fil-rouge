resource "kubernetes_service" "mydb-service" {

  metadata {
    name = "mydb-service"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      protocol = "TCP"
      port= 3306
      target_port = 3306
      node_port   = 30002
    }
    type = "NodePort"
  }
}
