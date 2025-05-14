resource "aws_db_subnet_group" "main" {
  name       = "csgtest-${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "csgtest-${var.environment}-rds-subnet-group"
    environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot  = true

  tags = {
    Name        = "csgtest-${var.environment}-rds"
    environment = var.environment
  }
}
