
resource "datadog_team" "team" {
  for_each    = var.team
  name        = each.value.name
  description = each.value.description
  handle      = each.value.handle
}

resource "datadog_authn_mapping" "team" {
  for_each = var.team_authn
  key      = each.value.key
  value    = each.value.value
  role     = each.value.role
  team     = datadog_team.team[each.key].id
}
