output "grafana_url" {
  value = "http://<grafana-loadbalancer-url>:3000"
}

output "prometheus_status" {
  value = helm_release.prometheus.status
}