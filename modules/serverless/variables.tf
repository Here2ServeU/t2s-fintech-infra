# variables.tf content
variable "lambda_function_name" {
  default = "process-transactions"
}

variable "lambda_handler" {
  default = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  default = "python3.9"
}

variable "lambda_zip_path" {
  description = "Path to zipped Lambda function"
  type        = string
}

variable "api_gateway_name" {
  default = "FintechTransactionAPI"
}