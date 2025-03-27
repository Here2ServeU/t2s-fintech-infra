variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "enable_cloudwatch_logs" {
  description = "Enable CloudWatch logs"
  type        = bool
  default     = true
}