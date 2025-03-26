# main.tf content
resource "aws_security_group" "web_sg" {
  name        = "fintech-web-sg"
  description = "Allow HTTPS"
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