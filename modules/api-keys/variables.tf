variable "api_key" {
  type = map(object({
    name   = string
    suffix = optional(string, "Created by Terraform")
  }))
  description = "A MAP Object of Datadog API Keys"
}
