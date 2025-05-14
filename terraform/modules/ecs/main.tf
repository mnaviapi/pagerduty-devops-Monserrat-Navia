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
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.task_execution_role

  container_definitions = jsonencode([
    {
      name      = "nginx"
      image     = var.image_url
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "this" {
  name            = "csgtest-${var.environment}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = true
    security_groups  = [] # Puedes pasar uno si quieres
  }

  depends_on = [aws_ecs_task_definition.this]
}
