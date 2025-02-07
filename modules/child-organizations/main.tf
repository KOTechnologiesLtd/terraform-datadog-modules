/*
At the time of creation, the datadog_child_organization,
does not delete or rename an organization, hence prevent_destroy = true
*/
resource "datadog_child_organization" "child_organization" {
  for_each = var.child_organization
  name     = each.value.name
  lifecycle {
    prevent_destroy = true
  }
}
