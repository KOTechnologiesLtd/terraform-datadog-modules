output "child_organization" {
  value     = { for k, v in datadog_child_organization.child_organization : k => v }
  sensitive = true
}

output "child_organization_ids" {
  value     = { for k, v in datadog_child_organization.child_organization : k => v.id }
  sensitive = false
}

output "child_organization_api_keys" {
  value     = { for k, v in datadog_child_organization.child_organization : k => v.api_key[0].key }
  sensitive = true
}

output "child_organization_app_keys" {
  value     = { for k, v in datadog_child_organization.child_organization : k => v.application_key[0].hash }
  sensitive = true
}
