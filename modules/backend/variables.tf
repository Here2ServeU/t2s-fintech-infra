# variables.tf content
variable "s3_bucket_name" {
  description = "Terraform state bucket name"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for state locking"
  type        = string
}