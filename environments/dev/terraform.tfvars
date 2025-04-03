vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

db_password         = "MySecureP@ssword123!"
lambda_zip_path     = "../artifacts/transaction-lambda.zip"
ecs_container_image = "730335276920.dkr.ecr.us-east-1.amazonaws.com/transaction-service:latest"