resource "aws_ecs_cluster" "this" {
  name = "csgtest-${var.environment}-cluster"

  tags = {
    Name        = "csgtest-${var.environment}-cluster"
    environment = var.environment
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = "csgtest-${var.environment}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
    }
  ])
}
