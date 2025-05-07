variable "ddintegrationaws" {
  type = map(object({
    account_tags          = optional(list(string), [])
    aws_account_id        = string
    aws_partition         = optional(string, "aws")
    aws_regions           = optional(list(string), ["all"])
    auth_config_role_name = optional(string, "terraform-ddintegrationaws-kotechnologies")
    logs_config           = optional(object({ lambdas = list(string), sources = string }), null)
    metrics_config = object({ automute_enabled = optional(bool, true),
      collect_cloudwatch_alarms = optional(bool, false),
      collect_custom_metrics    = optional(bool, false),
      enabled                   = optional(bool, true),
      ns_filters_include_only   = optional(list(string), null),
      ns_filters_exclude_only   = optional(list(string), ["AWS/SQS", "AWS/ElasticMapReduce"]),
      # tag_filters_ns            = optional(string, "AWS/EC2"),
      # tag_filters_tags = optional(list(string), ["datadog:true"]) })
      tag_filters = optional(map(object({namespace = string, tags = list(string)})), {default = {namespace = "AWS/EC2", tags = ["datadog:true"]}})})
    resources_config = optional(object({ cloud_spm_mgmt = bool, ext_collection = bool }), null)
    traces_config    = optional(object({ xray_include_all = bool, xray_include_only = list(string) }), null)
  }))
  description = "A MAP Object of Datadog AWS Integration"
}