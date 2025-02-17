output "monjsonfiles" {
  value = { for index, f in var.monjsonfiles : f => datadog_monitor_json.monjsonfiles[f].id }
}
