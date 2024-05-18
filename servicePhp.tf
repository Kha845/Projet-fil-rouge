resource "kubernetes_service" "php-service" {

  metadata {
    name = "php-service"
  }

  spec {
    selector = {
      app = "php"
    }

    port {
      protocol = "TCP"
      port= 9090
      target_port=80
      node_port=30003
    }

    type = "NodePort"
  }
}
