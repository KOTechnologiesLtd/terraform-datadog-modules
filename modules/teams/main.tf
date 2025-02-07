
resource "datadog_team" "team" {
  for_each    = var.team
  name        = each.value.name
  description = each.value.description
  handle      = each.value.handle
}
