# Required module inputs

variable "cluster_name" {}
variable "cluster_identity_oidc_issuer" {}
variable "cluster_identity_oidc_issuer_arn" {}

# alb-ingress

variable "enabled" {
  type = bool
}

variable "replica_count" {
  default = 2
}

variable "ingress_class" {
  default = "alb-ingress"
}

# Helm

variable "helm_chart_name" {
  default = "aws-alb-ingress-controller"
}

variable "helm_chart_version" {
  default = "0.1.13"
}

variable "helm_release_name" {
  default = "aws-alb-ingress-controller"
}

variable "helm_repo_url" {
  default = "http://storage.googleapis.com/kubernetes-charts-incubator"
}

# K8S

variable "k8s_namespace" {
  default     = "alb-ingress"
  description = "The k8s namespace in which the alb-ingress service account has been created"
}

variable "k8s_service_account_name" {
  default     = "aws-alb-ingress-controller"
  description = "The k8s alb-ingress service account name"
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable"
}
