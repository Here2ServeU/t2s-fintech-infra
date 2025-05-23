variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
}

variable "lambda_zip_path" {
  description = "Path to the zipped Lambda package"
  type        = string
}

variable "ecs_container_image" {
  description = "Container image for ECS service"
  type        = string
}