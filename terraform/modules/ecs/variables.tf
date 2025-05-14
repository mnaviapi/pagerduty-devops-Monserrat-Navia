variable "environment" {}
variable "cpu" {}
variable "memory" {}
variable "container_image" {}
variable "container_port" {}
variable "execution_role_arn" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
