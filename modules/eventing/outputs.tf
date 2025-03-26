# outputs.tf content
output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "sqs_queue_url" {
  value = aws_sqs_queue.transaction_queue.id
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.financial_events.name
}