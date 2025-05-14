provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                = "../../modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_1_cidr  = "10.0.1.0/24"
  az_1                  = "us-east-1a"
  environment           = "dev"
}

module "ecs" {
  source              = "../../modules/ecs"
  environment         = "dev"
  container_image     = "nginx"
  execution_role_arn  = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole" # ← reemplaza con el tuyo
}
