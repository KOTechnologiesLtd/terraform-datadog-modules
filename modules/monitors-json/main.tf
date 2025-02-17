
resource "datadog_monitor_json" "monjsonfiles" {
  for_each = { for index, f in var.monjsonfiles : index => f }
  monitor  = file(each.value)
}
