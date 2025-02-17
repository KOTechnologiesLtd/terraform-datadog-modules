
resource "datadog_monitor_json" "monjsonfiles" {
  for_each = { for index, f in var.monjsonfiles : f => f }
  monitor  = file(each.value)
}
