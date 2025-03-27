vpc_cidr           = "10.1.0.0/16"
public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets    = ["10.1.3.0/24", "10.1.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

db_password         = "StageSecureP@ssword456!"
lambda_zip_path     = "../artifacts/transaction-lambda.zip"
ecs_container_image = "123456789012.dkr.ecr.us-east-1.amazonaws.com/transaction-service:staging"