# Deploying the `t2s-fintech-infra` Infrastructure

This guide walks you through deploying your AWS infrastructure using Terraform for the T2S FinTech application.

---

## Prerequisites

1. **Install Required Tools:**
   - [Terraform](https://developer.hashicorp.com/terraform/downloads)
   - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
   - [Git](https://git-scm.com/)

2. **Configure AWS CLI:**

   ```bash
   aws configure
   ```

   Enter your:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region: `us-east-1`
   - Default output format: `json`

3. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-org/t2s-fintech-infra.git
   cd t2s-fintech-infra
   ```

---

## Step-by-Step Deployment

### Step 1: Bootstrap the Remote Backend

This step creates the S3 bucket and DynamoDB table for storing and locking your Terraform state.

```bash
cd environments/bootstrap

terraform init
terraform apply -auto-approve
```

This only needs to be done once.

---

### Step 2: Deploy the Dev Environment

This step deploys the full infrastructure for your development environment.

```bash
cd ../../environments/dev

terraform init
terraform plan
terraform apply -auto-approve
```

Remove `-auto-approve` if you prefer to manually approve changes.

---

### Step 3: Deploy Stage and Prod Environments

Repeat the process for each environment.

**Stage:**

```bash
cd ../../environments/stage
terraform init
terraform plan
terraform apply -auto-approve
```

**Prod:**

```bash
cd ../../environments/prod
terraform init
terraform plan
terraform apply -auto-approve
```

---

### Step 4: Configure GitHub Actions CI/CD

1. Push your code to a GitHub repository.

2. Add AWS credentials to GitHub Secrets:
   - Go to **Settings > Secrets and Variables > Actions**
   - Click **New repository secret**
   - Add the following secrets:
     - `AWS_ACCESS_KEY_ID`
     - `AWS_SECRET_ACCESS_KEY`

3. Push your changes to the `main` branch:

   ```bash
   git add .
   git commit -m "Initial infrastructure setup"
   git push origin main
   ```

This will trigger the GitHub Actions pipeline in `.github/workflows/terraform.yml` to:

- Check Terraform formatting
- Validate the configuration
- Plan changes
- Apply changes (on `main`)

---

## Optional Enhancements

- Use [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs) for collaboration and remote execution.
- Enable Slack or email notifications for CI/CD results.
- Package Lambda functions and store them in S3 with versioned keys.
- Integrate with CloudTrail and AWS Config for auditing.

---

## Summary

| Step               | Description                                      |
|--------------------|--------------------------------------------------|
| Bootstrap          | Creates remote state infrastructure              |
| Dev Deployment     | Deploys VPC, databases, serverless, containers   |
| Stage/Prod         | Isolated environments for higher-level testing   |
| GitHub Actions     | Automates Terraform CI/CD workflows              |
| GitHub Secrets     | Protects AWS credentials for GitHub runner       |
