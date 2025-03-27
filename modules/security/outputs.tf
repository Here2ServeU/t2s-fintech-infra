output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "inspector_enabled" {
  value = var.enable_inspector
}