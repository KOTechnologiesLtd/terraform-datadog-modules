## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_api_key.api_key](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/api_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | A MAP Object of Datadog API Keys | <pre>map(object({<br>    name   = string<br>    suffix = optional(string, "Created by Terraform")<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_keys"></a> [api\_keys](#output\_api\_keys) | n/a |
