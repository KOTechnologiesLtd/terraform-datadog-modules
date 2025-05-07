## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.ddintegrationaws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ddintegrationaws_readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ddintegrationaws_security](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [datadog_integration_aws_account.ddintegrationaws](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/integration_aws_account) | resource |
| [aws_iam_policy_document.ddintegrationaws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddintegrationaws"></a> [ddintegrationaws](#input\_ddintegrationaws) | A MAP Object of Datadog AWS Integration | <pre>map(object({<br/>    account_tags          = list(string)<br/>    aws_account_id        = string<br/>    aws_partition         = optional(string, "aws")<br/>    aws_regions           = optional(list(string), ["all"])<br/>    auth_config_role_name = optional(string, "terraform-ddintegrationaws-kotechnologies")<br/>    logs_config           = optional(object({ lambdas = list(string), sources = string }), null)<br/>    metrics_config = object({ automute_enabled = optional(bool, true),<br/>      collect_cloudwatch_alarms = optional(bool, false),<br/>      collect_custom_metrics    = optional(bool, false),<br/>      enabled                   = optional(bool, true),<br/>      ns_filters_include_only   = optional(list(string), null),<br/>      ns_filters_exclude_only   = optional(list(string), ["AWS/SQS", "AWS/ElasticMapReduce"]),<br/>      # tag_filters_ns            = optional(string, "AWS/EC2"),<br/>      # tag_filters_tags = optional(list(string), ["datadog:true"]) })<br/>      tag_filters = optional(map(object({namespace = string, tags = list(string)})), {default = {namespace = "AWS/EC2", tags = ["datadog:true"]}})})<br/>    resources_config = optional(object({ cloud_spm_mgmt = bool, ext_collection = bool }), null)<br/>    traces_config    = optional(object({ xray_include_all = bool, xray_include_only = list(string) }), null)<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ddintegrationsaws"></a> [ddintegrationsaws](#output\_ddintegrationsaws) | n/a |
