output "aurora_cluster_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}

output "aurora_writer_instance_id" {
  value = aws_rds_cluster_instance.aurora_instances[0].id
}

output "dynamodb_table" {
  value = aws_dynamodb_table.ledger.name
}