resource "kubernetes_namespace" "alb_ingress" {
  depends_on = [var.mod_dependency]
  count      = (var.enabled && var.k8s_namespace != "kube-system") ? 1 : 0

  metadata {
    name = var.k8s_namespace
  }
}

### iam ###
# Policy
data "http" "alb_ingress_policy" {
  depends_on = [var.mod_dependency]
  count      = var.enabled ? 1 : 0

  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
}

resource "aws_iam_policy" "alb_ingress" {
  depends_on  = [var.mod_dependency]
  count       = var.enabled ? 1 : 0
  name        = "${var.cluster_name}-alb-ingress"
  path        = "/"
  description = "Policy for alb-ingress service"

  policy = data.http.alb_ingress_policy[0].body
}

# Role
data "aws_iam_policy_document" "alb_ingress_assume" {
  depends_on = [var.mod_dependency]
  count      = var.enabled ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.k8s_namespace}:${var.k8s_service_account_name}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "alb_ingress" {
  depends_on         = [var.mod_dependency]
  count              = var.enabled ? 1 : 0
  name               = "${var.cluster_name}-alb-ingress"
  assume_role_policy = data.aws_iam_policy_document.alb_ingress_assume[0].json
}

resource "aws_iam_role_policy_attachment" "alb_ingress" {
  depends_on = [var.mod_dependency]
  count      = var.enabled ? 1 : 0
  role       = aws_iam_role.alb_ingress[0].name
  policy_arn = aws_iam_policy.alb_ingress[0].arn
}
