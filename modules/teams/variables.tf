variable "team" {
  type = map(object({
    name        = string
    description = string
    handle      = string
  }))
  validation {
    condition     = alltrue([for o in var.team : provider::assert::lowercased(o.handle)])
    error_message = "Datadog Team Handle must be lowercase"
  }
  description = "A MAP Object of Datadog Teams"
}
variable "team_authn" {
  type = map(object({
    key   = string
    value = string
    role  = optional(string, null)
    team  = optional(string, null)
  }))
  default = {}
  description = "A MAP Object of Datadog Teams AuthN Mapping. Role & Team Conflict. Map keys must match var.team"
}