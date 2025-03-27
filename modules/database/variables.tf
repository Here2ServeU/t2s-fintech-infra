variable "vpc_id" {
  description = "VPC ID for database resources"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnets for database cluster"
  type        = list(string)
}

variable "db_name" {
  description = "Database name"
  default     = "fintechdb"
}

variable "db_username" {
  description = "Database master username"
  default     = "admin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}