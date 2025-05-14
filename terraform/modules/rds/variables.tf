variable "environment" {
  type        = string
  description = "Environment name (dev or prod)"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for RDS subnet group"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Database password"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID that allows access to RDS"
}
