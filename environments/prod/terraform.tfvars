vpc_cidr           = "10.2.0.0/16"
public_subnets     = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnets    = ["10.2.3.0/24", "10.2.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

db_password         = "ProdUltraSecureP@ssword789!"
lambda_zip_path     = "../artifacts/transaction-lambda.zip"
ecs_container_image = "123456789012.dkr.ecr.us-east-1.amazonaws.com/transaction-service:latest"