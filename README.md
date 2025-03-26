# T2S FinTech Infrastructure

Terraform-based infrastructure for a Lending FinTech application on AWS.

## GitHub Repo Structure
```plaintext 
t2s-fintech-infra/
│
├── .github/
│   └── workflows/
│       └── terraform.yml          # GitHub Actions CI/CD Pipeline
│
├── modules/
│   ├── backend/                   # S3 + DynamoDB for remote state
│   ├── networking/                # VPC, Subnets, NAT
│   ├── security/                  # IAM, WAF, GuardDuty
│   ├── database/                  # Aurora, RDS, DynamoDB
│   ├── serverless/                # Lambda + API Gateway
│   ├── eventing/                  # SNS, SQS, Kinesis
│   ├── ecs/                       # ECS Fargate setup
│   └── eks/                       # EKS Cluster setup
│
├── environments/
│   ├── bootstrap/                 # Create backend infrastructure
│   ├── dev/
│   ├── stage/
│   └── prod/
│
├── artifacts/                     # Lambda zip files, etc.
│
├── backend.tf                     # Remote backend definition
├── providers.tf                   # Provider config
├── versions.tf                    # Terraform & provider versions
├── variables.tf                   # Shared root variables
├── .gitignore
└── README.md
```

## Features

- **Security & Compliance**: IAM, GuardDuty, WAF, Shield (PCI DSS, SOC 2, GDPR-ready)
- **Databases**: Aurora (Multi-AZ), RDS PostgreSQL, DynamoDB
- **Serverless**: Lambda + API Gateway for transaction processing
- **Event-Driven**: SNS, SQS, Kinesis for messaging/streaming
- **Microservices**: ECS (Fargate) & EKS (Kubernetes)
- **Environments**: dev, stage, prod

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/your-org/t2s-fintech-infra.git
cd t2s-fintech-infra