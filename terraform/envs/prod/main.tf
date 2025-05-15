provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                = "../../modules/vpc"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_1_cidr  = "10.0.1.0/24"
  az_1                  = "us-east-1a"
  environment           = "prod"
}

resource "aws_security_group" "rds_sg" {
  name        = "prod-rds-sg"
  description = "Allow inbound MySQL"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # O restringe a tu IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod-rds-sg"
  }
}


module "rds" {
  source              = "../../modules/rds"
  environment         = "prod"
  subnet_ids          = [module.vpc.public_subnet_1_id]
  db_name             = "prod_db"
  db_user             = "admin"
  db_password         = jsondecode(data.aws_secretsmanager_secret_version.rds_password.secret_string)["db_password"]
  instance_class      = "db.t3.micro"
  engine              = "mysql"
  engine_version      = "8.0"
  security_group_id   = aws_security_group.rds_sg.id
}

module "ecs_iam_role" {
  source      = "../../modules/iam"
  environment = "prod"
}

module "ecs" {
  source              = "../../modules/ecs"
  environment         = "prod"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = [module.vpc.public_subnet_1_id]
  task_execution_role = module.ecs_iam_role.role_arn
  image_url           = "nginx:latest"
  container_port      = 80
}
