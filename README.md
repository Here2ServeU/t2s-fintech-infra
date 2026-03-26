# t2s-fintech-infra

Terraform infrastructure code for a production-style FinTech platform on AWS.

## Project Overview

This repository defines modular infrastructure for a secure, scalable, and observable cloud platform. It supports multi-environment deployments and includes containerized sample applications under the `docker/` directory.

## Maintainer Bio

Emmanuel Naweji

- PhD
- Infrastructure, AI, DevOps, and Cloud Mentor

## Repository Structure

```text
.
|-- backend.tf
|-- providers.tf
|-- variables.tf
|-- versions.tf
|-- environments/
|   |-- bootstrap/
|   |-- dev/
|   |-- stage/
|   |-- prod/
|-- modules/
|   |-- networking/
|   |-- security/
|   |-- database/
|   |-- ecs/
|   |-- eks/
|   |-- serverless/
|   |-- eventing/
|   |-- observability/
`-- docker/
    |-- backend/
    `-- frontend/
```

## Core Modules

- `modules/networking`: VPC, subnets, route tables, and network foundations.
- `modules/security`: IAM, security groups, and security-focused controls.
- `modules/database`: Data layer infrastructure.
- `modules/ecs`: Container orchestration on ECS.
- `modules/eks`: Kubernetes orchestration on EKS.
- `modules/serverless`: Serverless components for API and automation workflows.
- `modules/eventing`: Event-driven integration components.
- `modules/observability`: Monitoring stack configuration and observability resources.

## Environments

- `environments/bootstrap`: One-time setup for remote Terraform state (for example S3 and DynamoDB locking).
- `environments/dev`: Development deployment.
- `environments/stage`: Staging deployment.
- `environments/prod`: Production deployment.

Each environment contains a dedicated `main.tf` and `terraform.tfvars` to isolate configuration.

## Prerequisites

Install:

- Terraform
- AWS CLI
- Git

Authenticate AWS CLI:

```bash
aws configure
```

## Deployment Workflow

### 1. Bootstrap remote state

```bash
cd environments/bootstrap
terraform init
terraform plan
terraform apply
```

### 2. Deploy an environment

Example for development:

```bash
cd ../dev
terraform init
terraform plan
terraform apply
```

Repeat the same flow for `stage` and `prod`.

## Common Terraform Commands

```bash
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Recommended Delivery Practices

- Run `terraform fmt` and `terraform validate` before every commit.
- Use pull requests for all infrastructure changes.
- Use separate AWS credentials and state isolation per environment.
- Review plans carefully for production changes.

## Docker Apps

The `docker/` directory includes:

- `docker/backend`: Flask app and template assets.
- `docker/frontend`: Express static frontend.

See `docker/README.md` for build and run details.

## Notes

This codebase is structured for extensibility. Add or evolve modules without coupling environment logic to service-specific implementation.
