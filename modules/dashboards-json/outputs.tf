output "dashjsonfiles" {
  value = { for index, f in var.dashjsonfiles : f => datadog_dashboard_json.dashjsonfiles[f].url }
}
