# main.tf content
resource "aws_sns_topic" "alerts" {
  name = "fintech-alerts-topic"
}

resource "aws_sqs_queue" "transaction_queue" {
  name = "fintech-transaction-queue"
}

resource "aws_kinesis_stream" "financial_events" {
  name             = "fintech-financial-events"
  shard_count      = 1
  retention_period = 24
}