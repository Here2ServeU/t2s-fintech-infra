provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Prometheus via Helm
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "45.7.1"
  namespace  = "monitoring"

  create_namespace = true
  values = [
    file("${path.module}/prometheus-values.yaml")
  ]
}

# Grafana via Helm
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "7.3.7"
  namespace  = "monitoring"
  create_namespace = false

  values = [
    file("${path.module}/grafana-values.yaml")
  ]
}

# CloudWatch Logs enabled via EKS logging
resource "aws_eks_cluster" "eks" {
  name = var.cluster_name
  enabled_cluster_log_types = var.enable_cloudwatch_logs ? [
    "api", "audit", "authenticator", "controllerManager", "scheduler"
  ] : []
}