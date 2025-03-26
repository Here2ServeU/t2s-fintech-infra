# variables.tf content
variable "vpc_id" {}
variable "subnet_ids" {
  description = "Private subnets for DB cluster"
  type        = list(string)
}
variable "db_name" {
  default = "fintechdb"
}
variable "db_username" {
  default = "admin"
}
variable "db_password" {}