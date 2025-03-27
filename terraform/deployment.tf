resource "kubernetes_deployment" "nodejs-deployment" {
    metadata {
        name = var.deployment
        labels = {
            appname = "nodejs-webapp"
        }
        namespace = kubernetes_namespace.nodejs-web-ns.metadata[0].name
    }
    spec {
        replicas = 5
        selector {
            match_labels = var.selection_label
        }
        template {
            metadata {
                labels = var.selection_label
            }
            spec {
                container {
                    image = "lalitraw16/nodejs-app:latest"
                    name = "nodejs-webapp"
                resources {
                    limits = {
                        cpu = "500m"
                        memory = "256Mi"
                    }
                    requests = {
                        cpu = "250m"
                        memory = "128Mi"
                    }
                }
                liveness_probe {
                    http_get {
                        path = "/"
                        port = 3000
                    }
                    initial_delay_seconds = 3
                    period_seconds        = 3
                }
                }
            }
        }    
    }
}