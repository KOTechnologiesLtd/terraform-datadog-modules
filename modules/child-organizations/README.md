## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_child_organization.child_organization](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/child_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_child_organization"></a> [child\_organization](#input\_child\_organization) | A MAP Object of Datadog Child Organizations | <pre>map(object({<br>    name = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_child_organization"></a> [child\_organization](#output\_child\_organization) | n/a |
| <a name="output_child_organization_api_keys"></a> [child\_organization\_api\_keys](#output\_child\_organization\_api\_keys) | n/a |
| <a name="output_child_organization_app_keys"></a> [child\_organization\_app\_keys](#output\_child\_organization\_app\_keys) | n/a |
| <a name="output_child_organization_ids"></a> [child\_organization\_ids](#output\_child\_organization\_ids) | n/a |
