output "monjsonfiles" {
  value = { for index, f in var.monjsonfiles : index => datadog_monitor_json.monjsonfiles[index].url }
}
