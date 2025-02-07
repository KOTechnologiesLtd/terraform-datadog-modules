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
| [datadog_team.team](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/team) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_team"></a> [team](#input\_team) | A MAP Object of Datadog Teams | <pre>map(object({<br>    name        = string<br>    description = string<br>    handle      = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_team"></a> [team](#output\_team) | n/a |
| <a name="output_team_ids"></a> [team\_ids](#output\_team\_ids) | n/a |
