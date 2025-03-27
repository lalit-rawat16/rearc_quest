resource "kubernetes_service" "nodejs-service" {
  metadata {
    name = var.service
    namespace = kubernetes_namespace.nodejs-web-ns.metadata[0].name
  }
  spec {
    selector = {
      appname = kubernetes_deployment.nodejs-deployment.spec.0.template.0.metadata[0].labels.appname
    }
    port {
      protocol   = "TCP"
      port        = 8080
      target_port = 3000
    }

    type = "ClusterIP"
  }
}