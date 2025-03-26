# main.tf content
# Aurora Multi-AZ Cluster
resource "aws_rds_subnet_group" "aurora" {
  name       = "aurora-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier = "fintech-aurora-cluster"
  engine             = "aurora-mysql"
  master_username    = var.db_username
  master_password    = var.db_password
  database_name      = var.db_name
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  db_subnet_group_name    = aws_rds_subnet_group.aurora.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count              = 2
  identifier         = "aurora-node-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = "db.r6g.large"
  engine             = "aurora-mysql"
  publicly_accessible = false
}

# DynamoDB Ledger Table
resource "aws_dynamodb_table" "ledger" {
  name         = "FintechLedger"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TransactionID"

  attribute {
    name = "TransactionID"
    type = "S"
  }

  tags = {
    Environment = "prod"
    Application = "FintechAccounting"
  }
}

# DB Security Group
resource "aws_security_group" "db_sg" {
  name   = "db-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}