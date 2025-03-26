# variables.tf content
variable "cluster_name" {
  default = "fintech-eks"
}

variable "subnet_ids" {
  type = list(string)
}

variable "role_arn" {}