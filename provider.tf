terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "C:/Users/dell/.kube/config"
  config_context = "minikube"
}
