resource "helm_release" "alb_ingress" {
  depends_on = [var.mod_dependency]
  count      = var.enabled ? 1 : 0
  name       = var.helm_release_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  namespace  = var.k8s_namespace
  version    = var.helm_chart_version

  values = [
    "${templatefile("${path.module}/templates/values.yaml.tpl",
      {
        "cluster_name"             = var.cluster_name,
        "alb_ingress_iam_role_arn" = aws_iam_role.alb_ingress[0].arn
        "replica_count"            = var.replica_count
        "ingress_class"            = var.ingress_class
      })
    }"
  ]
}
