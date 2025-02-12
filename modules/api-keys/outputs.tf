output "api_keys" {
  value     = { for k, v in datadog_api_key.api_key : k => v }
  sensitive = true
}
