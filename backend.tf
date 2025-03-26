# backend.tf content
terraform {
  backend "s3" {
    bucket         = "t2s-fintech-terraform-state"
    key            = "infra/global/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "t2s-terraform-locks"
  }
}