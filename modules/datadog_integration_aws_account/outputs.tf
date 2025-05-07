output "ddintegrationsaws" {
  value = { for k, v in datadog_integration_aws_account.ddintegrationaws : k => v }
  sensitive = true
}
