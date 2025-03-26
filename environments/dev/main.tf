# main.tf content
provider "aws" {
  region = var.aws_region
}

module "networking" {
  source             = "../../modules/networking"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "security" {
  source  = "../../modules/security"
  vpc_id  = module.networking.vpc_id
}

module "database" {
  source        = "../../modules/database"
  vpc_id        = module.networking.vpc_id
  subnet_ids    = module.networking.private_subnet_ids
  db_password   = var.db_password
}

module "serverless" {
  source              = "../../modules/serverless"
  lambda_zip_path     = var.lambda_zip_path
}

module "eventing" {
  source = "../../modules/eventing"
}

module "ecs" {
  source              = "../../modules/ecs"
  container_image     = var.ecs_container_image
  subnet_ids          = module.networking.public_subnet_ids
  security_group_ids  = [module.security.web_sg_id]
}

module "eks" {
  source        = "../../modules/eks"
  subnet_ids    = module.networking.private_subnet_ids
  role_arn      = module.eks.eks_cluster_name # circular? fix in prod
}