variable "child_organization" {
  type = map(object({
    name = string
  }))
  validation {
    condition     = alltrue([for o in var.child_organization : length(o.name) < 32])
    error_message = "Datadog Child Organization Name must be less than 32 Characters"
  }
  validation {
    condition     = alltrue([for o in var.child_organization : length(o.name) > 2])
    error_message = "Datadog Child Organization Name must be more than 2 Characters"
  }
  description = "A MAP Object of Datadog Child Organizations"
}
