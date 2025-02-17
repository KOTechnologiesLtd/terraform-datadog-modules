output "dashjsonfiles" {
  value = { for index, f in var.dashjsonfiles : index => datadog_dashboard_json.dashjsonfiles[index].url }
}
