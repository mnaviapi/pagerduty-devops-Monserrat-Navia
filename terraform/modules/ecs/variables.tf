variable "environment" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "task_execution_role" {}
variable "image_url" {}
variable "container_port" {}
