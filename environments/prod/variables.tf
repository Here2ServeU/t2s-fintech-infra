variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.2.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.2.1.0/24", "10.2.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.2.3.0/24", "10.2.4.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
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