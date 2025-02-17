
resource "datadog_dashboard_json" "dashjsonfiles" {
  for_each  = { for index, f in var.dashjsonfiles : index => f }
  dashboard = file(each.value)
}
