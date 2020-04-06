## Resources created by the ALB Ingress controller will be prefixed with this string
## Required
clusterName: ${ cluster_name }

scope:
  ## If provided, the ALB ingress controller will only act on Ingress resources annotated with this class
  ## Ref: https://github.com/kubernetes-sigs/aws-alb-ingress-controller/blob/master/docs/guide/controller/config.md#limiting-ingress-class
  ingressClass: ${ ingress_class }

rbac:
  create: true
  serviceAccountAnnotations:
    eks.amazonaws.com/role-arn: ${ alb_ingress_iam_role_arn }

resources:
  requests:
    memory: "64Mi"
  limits:
    memory: "128Mi"

image:
  repository: docker.io/amazon/aws-alb-ingress-controller
  tag: "v1.1.5"
  pullPolicy: IfNotPresent

replicaCount: ${ replica_count }

## Auto Discover awsRegion from ec2metadata, set this to true and omit awsRegion when ec2metadata is available.
autoDiscoverAwsRegion: true

## Auto Discover awsVpcID from ec2metadata, set this to true and omit awsVpcID: " when ec2metadata is available.
autoDiscoverAwsVpcID: true
