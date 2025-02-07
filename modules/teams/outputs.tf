output "team" {
  value     = { for k, v in datadog_team.team : k => v }
  sensitive = false
}

output "team_ids" {
  value     = { for k, v in datadog_team.team : k => v.id }
  sensitive = false
}