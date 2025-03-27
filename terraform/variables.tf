variable "namespace" {
  type = string
  default = "nodejs-web-ns"
}

variable "deployment" {
  type = string
  default = "nodejs-webapp-deploy"
}

variable "service" {
  type = string
  default = "nodejs-services"
}

variable "ingress" {
  type = string
  default = "nodejs-ingress"
}

variable "selection_label" {
    type = map(string)
    default = {
        appname = "nodejs-webapp"
    }
} 