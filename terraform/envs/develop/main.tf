provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                = "../../modules/vpc"
  vpc_cidr              = "10.1.0.0/16"
  public_subnet_1_cidr  = "10.1.1.0/24"
  az_1                  = "us-east-1a"
  environment           = "develop"
}

module "ecs_iam_role" {
  source      = "../../modules/iam"
  environment = "develop"
}

module "ecs" {
  source              = "../../modules/ecs"
  environment         = "develop"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = [module.vpc.public_subnet_1_id]
  task_execution_role = module.ecs_iam_role.role_arn
  image_url           = "nginx:latest"
  container_port      = 80
}
