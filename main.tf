locals {
  values = yamlencode({
    "clusterName" : var.cluster_name
    "rbac" : {
      "create" : true
      "serviceAccount" : {
        "create" : true
        "annotations" : {
          "eks.amazonaws.com/role-arn" : aws_iam_role.alb_ingress[0].arn
        }
      }

    }
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values,
    var.values
  ])
}


resource "helm_release" "alb_ingress" {
  count            = var.enabled ? 1 : 0
  name             = var.helm_release_name
  repository       = var.helm_repo_url
  chart            = var.helm_chart_name
  create_namespace = var.k8s_create_namespace
  namespace        = var.k8s_namespace
  version          = var.helm_chart_version

  values = [
    data.utils_deep_merge_yaml.values[0].output
  ]

  dynamic "set" {
    for_each = var.settings

    content {
      name  = set.key
      value = set.value
    }
  }
}
