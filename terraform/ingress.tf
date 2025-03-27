# resource "kubernetes_ingress_v1" "nodejs_ingress" {
#   wait_for_load_balancer = true
#   metadata {
#     name = var.ingress
#     namespace = kubernetes_namespace.nodejs-web-ns.metadata[0].name
#     annotations = {
#         "alb.ingress.kubernetes.io/load-balancer-name" = var.ingress
#         "alb.ingress.kubernetes.io/target-type" = "ip"
#         "alb.ingress.kubernetes.io/scheme" = "internet-facing"
#     }
#   }

#   spec {
#     ingress_class_name = "alb"
#     default_backend {
#         service {
#             name = kubernetes_service.nodejs-service.metadata.0.name
#             port {
#                 number = 8080
#             }
#         }
#     }
#   }
# }

resource "kubernetes_ingress_v1" "nodejs_ingress" {
  wait_for_load_balancer = true
  metadata {
    name = var.ingress
    namespace = kubernetes_namespace.nodejs-web-ns.metadata[0].name
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = var.ingress
        "alb.ingress.kubernetes.io/target-type" = "ip"
        "alb.ingress.kubernetes.io/scheme" = "internet-facing"
        "alb.ingress.kubernetes.io/backend-protocol" = "HTTP"
    }
  }

  spec {
    ingress_class_name = "alb"
    default_backend {
        service {
            name = kubernetes_service.nodejs-service.metadata.0.name
            port {
                number = 8080
            }
        }
    }
  }
}