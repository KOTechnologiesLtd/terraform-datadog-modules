output "dashboards" {
  value = { for index, f in var.dashjsonfiles : index => datadog_dashboard_json.dashjson[index].url }
}
