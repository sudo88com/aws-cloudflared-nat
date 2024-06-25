# sudo88com/aws-cloudflared-nat

[![dev](https://img.shields.io/badge/dev-blue)](https://github.com/sudo88com/aws-cloudflared-nat/tree/dev)
[![Terraform Plan](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml/badge.svg?branch=dev)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml)
[![Terraform Apply](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml/badge.svg?branch=dev)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml)
[![Terraform Destroy](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml/badge.svg?branch=dev)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml)

[![pre](https://img.shields.io/badge/pre-blue)](https://github.com/sudo88com/aws-cloudflared-nat/tree/pre)
[![Terraform Plan](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml/badge.svg?branch=pre)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml)
[![Terraform Apply](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml/badge.svg?branch=pre)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml)
[![Terraform Destroy](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml/badge.svg?branch=prod)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml)

[![prod](https://img.shields.io/badge/prod-blue)](https://github.com/sudo88com/aws-cloudflared-nat/tree/prod)
[![Terraform Plan](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml/badge.svg?branch=prod)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_plan.yml)
[![Terraform Apply](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml/badge.svg?branch=prod)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_apply.yml)
[![Terraform Destroy](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml/badge.svg?branch=prod)](https://github.com/sudo88com/aws-cloudflared-nat/actions/workflows/terragrunt_destroy.yml)

## Overview
This setup configures a t3.nano EC2 instance to act as a NAT gateway with a Cloudflared tunnel, allowing Cloudflare WARP to access all VPC CIDR.

This project uses Terraform and Terragrunt to manage infrastructure for multiple environments (`dev`, `pre`, `prod`). The `Makefile` streamlines tasks such as initializing, planning, applying, and destroying infrastructure.

## Directory Structure

```
.
├── FILES
├── Makefile
├── README.md
├── dev.tfvars
├── modules
│   └── vpc
│       ├── README.md
│       ├── _locals.tf
│       ├── _main.tf
│       ├── _output.tf
│       ├── _variable.tf
│       ├── data.tf
│       ├── default.tfvars
│       ├── dev.tfvars
│       ├── pre.tfvars
│       ├── prod.tfvars
│       └── terragrunt.hcl
├── pre.tfvars
├── prod.tfvars
└── terragrunt.hcl
```

## Prerequisites

Ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/install)
- [Terragrunt](https://terragrunt.gruntwork.io/)
- [Packer](https://developer.hashicorp.com/packer/install)
- [GNU Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/)

# Terraform

## Makefile Targets

```bash
help      : Display help information
files     : List all files excluding `.git`
docs      : Generate Terraform documentation
fmt       : Format Terraform files
init      : Initialize Terraform
refresh   : Refresh Terraform state
plan      : Plan Terraform changes
apply     : Apply Terraform changes
destroy   : Destroy Terraform-managed infrastructure
tfclean   : Clean up Terraform and Terragrunt cache files
```

## Usage

### Configuring Terragrunt for S3 and DynamoDB

Configure `terragrunt.hcl` to use an S3 bucket for remote state storage and a DynamoDB table for state locking to ensure secure and conflict-free state management.

## Modules

Modules are located under `modules/`, e.g., the `vpc` module:

- `_locals.tf`: Local values
- `_main.tf`: Main configuration
- `_output.tf`: Output values
- `_variable.tf`: Variables
- `data.tf`: Data sources
- `default.tfvars`: Default variable values
- `dev.tfvars`: Development environment values
- `pre.tfvars`: Pre-production environment values
- `prod.tfvars`: Production environment values
- `terragrunt.hcl`: Terragrunt configuration

## Terragrunt

Specify the appropriate `tfvars` file for your environment.

## Environment Variables

Set `TF_VAR_CI_ENVIRONMENT_NAME` to specify the environment (`dev`, `pre`, `prod`).
Set `TF_VAR_CF_CLOUDFLARED_TOKEN` to specify `cloudflared` token.

# Packer

Packer is used to build a public AWS AMI image for Terraform.

## Makefile Targets

```bash
help          : Display help information
packer-fmt    : Format Packer files
packer-init   : Initialize Packer
packer-build  : Build Packer images
```

## Packer Configuration

Ensure you have the necessary `*.pkr.hcl` files configured for building your AMI.

## License

This project is licensed under the [MIT License](./LICENSE).
