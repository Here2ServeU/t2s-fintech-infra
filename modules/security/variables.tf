variable "vpc_id" {
  description = "VPC ID for security resources"
  type        = string
}

variable "enable_inspector" {
  description = "Enable Amazon Inspector for runtime scanning"
  type        = bool
  default     = true
}

variable "account_id" {
  description = "Your AWS account ID"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}