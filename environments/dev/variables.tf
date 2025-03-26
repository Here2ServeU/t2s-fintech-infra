# variables.tf content
variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "availability_zones" { type = list(string) }

variable "db_password" { sensitive = true }

variable "lambda_zip_path" { type = string }
variable "ecs_container_image" { type = string }