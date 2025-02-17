
resource "datadog_dashboard_json" "dashjsonfiles" {
  for_each  = { for index, f in var.dashjsonfiles : f => f }
  dashboard = file(each.value)
}
