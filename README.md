# AWS EKS ALB Ingress Terraform module

[![Labyrinth Labs logo](ll-logo.png)](https://www.lablabs.io)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

![Terraform validation](https://github.com/lablabs/terraform-aws-eks-alb-ingress/workflows/Terraform%20validation/badge.svg?branch=master)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-success?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Description

A terraform module to deploy an Application Load Balancer (ALB) Ingress Controller on Amazon EKS cluster.

## AWS region and VPC discovery

ALB Ingress controller Helm chart may discover AWS region and AWS VPC
automatically if `autoDiscoverAwsRegion` and `autoDiscoverAwsVpcID` parameters
are set to `true` (see `settings` input variable). Otherwise, you must set
`awsRegion` and `awsVpcID` parameters in order to deploy the controller.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0.0 |
| helm | >= 2.0.0 |
| kubernetes | >=2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account | `string` | n/a | yes |
| cluster\_name | The name of the cluster | `string` | n/a | yes |
| enabled | n/a | `bool` | n/a | yes |
| helm\_chart\_name | n/a | `string` | `"aws-alb-ingress-controller"` | no |
| helm\_chart\_version | n/a | `string` | `"0.1.13"` | no |
| helm\_release\_name | n/a | `string` | `"aws-alb-ingress-controller"` | no |
| helm\_repo\_url | n/a | `string` | `"http://storage.googleapis.com/kubernetes-charts-incubator"` | no |
| k8s\_namespace | The k8s namespace in which the alb-ingress service account has been created | `string` | `"alb-ingress"` | no |
| k8s\_service\_account\_name | The k8s alb-ingress service account name | `string` | `"aws-alb-ingress-controller"` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable | `any` | `null` | no |
| settings | Additional settings which will be passed to the Helm chart values, see https://hub.helm.sh/charts/incubator/aws-alb-ingress-controller | `map(any)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflow](.github/workflows/main.yml). A pull-request to the
master branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.


## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
