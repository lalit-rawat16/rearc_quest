resource "kubernetes_namespace" "nodejs-web-ns" {
    metadata {
        name = var.namespace
        annotations = {
          name = "nodejs-web"
        }

        labels = {
            project = "quest"
            managed_by = "terraform"
        }
    }
}