variable "lambda_function_name" {
  description = "Lambda function name"
  default     = "process-transactions"
}

variable "lambda_handler" {
  description = "Lambda handler"
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  default     = "python3.9"
}

variable "lambda_zip_path" {
  description = "Path to the zipped Lambda package"
  type        = string
}

variable "api_gateway_name" {
  description = "API Gateway name"
  default     = "FintechTransactionAPI"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}