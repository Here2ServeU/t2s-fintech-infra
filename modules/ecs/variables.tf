# variables.tf content
variable "ecs_cluster_name" {
  default = "fintech-ecs-cluster"
}

variable "service_name" {
  default = "transaction-service"
}

variable "container_image" {}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}