output "api_url" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.aws_region}.amazonaws.com/prod/transactions"
}

output "lambda_function_name" {
  value = aws_lambda_function.transaction.function_name
}