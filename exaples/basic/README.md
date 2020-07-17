# Basic example

The code in this example shows how to use the module with basic configuration
and minimal set of other resources.

## Hello world application

This example also contains resources which deploys a ‘Hello world’ application.
It is highly inspired by AWS ALB Ingress Controller [walkthrough: echoserver](https://kubernetes-sigs.github.io/aws-alb-ingress-controller/guide/walkthrough/echoserver/)

> **WARNING**: These resources are just an example, and they are commented
> intentionally. Individual ALBs are not managed directly by Terraform, they
> are managed by alb-ingress-controller. Therefor Terraform will not be able
> to remove all resources when running `terraform destroy` and it will fail
> after a timeout.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| helm | ~> 1.0 |
| kubernetes | ~> 1.10 |

## Inputs

No input.

## Outputs

No output.

 <!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Known issues

The `terraform apply` command may fail with error similar to
```text
Error: Post "https://******.eks.amazonaws.com/api/v1/namespaces": dial tcp ******: i/o timeout

  on ../../iam.tf line 1, in resource "kubernetes_namespace" "alb_ingress":
   1: resource "kubernetes_namespace" "alb_ingress" {

Error: Kubernetes cluster unreachable: Get https://******.eks.amazonaws.com/version?timeout=32s: dial tcp ******: i/o timeout

  on ../../main.tf line 1, in resource "helm_release" "alb_ingress":
   1: resource "helm_release" "alb_ingress" {
```

* https://github.com/terraform-providers/terraform-provider-aws/pull/11426
* https://github.com/aws/containers-roadmap/issues/654
