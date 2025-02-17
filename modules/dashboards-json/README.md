## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_assert"></a> [assert](#requirement\_assert) | 0.15.0 |
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
| [datadog_dashboard_json.dashjson](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/dashboard_json) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashjsonfiles"></a> [dashjsonfiles](#input\_dashjsonfiles) | A List of json file paths to create Dashboards from | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dashboards"></a> [dashboards](#output\_dashboards) | n/a |
