resource "datadog_api_key" "api_key" {
  for_each = var.api_key
  name     = "${each.value.name} ${each.value.suffix}"
  lifecycle {
    prevent_destroy = true
  }
}
