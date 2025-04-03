resource "aws_security_group" "web_sg" {
  name        = "fintech-web-sg"
  description = "Allow HTTPS traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_wafv2_web_acl" "waf" {
  name  = "fintech-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "fintechWAF"
    sampled_requests_enabled   = true
  }
}

resource "aws_guardduty_detector" "detector" {
  enable = true
}

# Enable Amazon Inspector v2 (ECR, Lambda, EC2 scanning)
resource "null_resource" "enable_inspector2" {
  count = var.enable_inspector ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
      aws inspector2 enable --resource-types ECR LAMBDA EC2 --region ${var.region}
    EOT
  }
}