resource "datadog_integration_aws_account" "ddintegrationaws" {
  for_each       = var.ddintegrationaws
  account_tags   = each.value.account_tags
  aws_account_id = each.value.aws_account_id
  aws_partition  = each.value.aws_partition
  aws_regions {
    include_all  = each.value.aws_regions[0] == "all" ? true : null
    include_only = each.value.aws_regions[0] != "all" ? each.value.aws_regions : null
  }

  auth_config {
    aws_auth_config_role {
      role_name = each.value.auth_config_role_name
    }
  }

  logs_config {
    lambda_forwarder {
      lambdas = each.value.logs_config == null ? [] : each.value.logs_config.lambdas
      sources = each.value.logs_config == null ? [] : each.value.logs_config.sources
    }
  }
  metrics_config {
    automute_enabled          = each.value.metrics_config == null ? true : each.value.metrics_config.automute_enabled
    collect_cloudwatch_alarms = each.value.metrics_config == null ? null : each.value.metrics_config.collect_cloudwatch_alarms
    collect_custom_metrics    = each.value.metrics_config == null ? null : each.value.metrics_config.collect_custom_metrics
    enabled                   = each.value.metrics_config == null ? null : each.value.metrics_config.enabled
    namespace_filters {
      exclude_only = each.value.metrics_config.ns_filters_include_only == null ? each.value.metrics_config.ns_filters_exclude_only : null
      include_only = each.value.metrics_config.ns_filters_include_only == null ? null : each.value.metrics_config.ns_filters_include_only
    }

    dynamic "tag_filters" {
      for_each = each.value.metrics_config.tag_filters == null ? {} : each.value.metrics_config.tag_filters
      content {
        namespace = tag_filters.value["namespace"]
        tags      = tag_filters.value["tags"]
      }
    }
  }
  resources_config {
    cloud_security_posture_management_collection = each.value.resources_config == null ? false : each.value.resources_config.cloud_spm_mgmt
    extended_collection                          = each.value.resources_config == null ? true : each.value.resources_config.ext_collection
  }
  traces_config {
    xray_services {
      include_all  = each.value.traces_config == null ? null : each.value.traces_config.xray_include_all
      include_only = each.value.traces_config == null ? [] : each.value.traces_config.xray_include_only
    }
  }
}

data "aws_iam_policy_document" "ddintegrationaws" {
  for_each = var.ddintegrationaws
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::464622532012:root"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values = [
        "${datadog_integration_aws_account.ddintegrationaws[each.key].auth_config.aws_auth_config_role.external_id}"
      ]
    }
  }
}
resource "aws_iam_role" "ddintegrationaws" {
  for_each           = var.ddintegrationaws
  name               = each.value.auth_config_role_name
  description        = "Role for Datadog AWS Integration"
  assume_role_policy = data.aws_iam_policy_document.ddintegrationaws[each.key].json
}


resource "aws_iam_role_policy_attachment" "ddintegrationaws_readonly" {
  for_each   = var.ddintegrationaws
  role       = aws_iam_role.ddintegrationaws[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "ddintegrationaws_security" {
  for_each   = var.ddintegrationaws
  role       = aws_iam_role.ddintegrationaws[each.key].name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

# data "datadog_integration_aws_available_namespaces" "ddnamepaces" {

# }
# output "ddnamespace"{
#   value = data.datadog_integration_aws_available_namespaces.ddnamepaces.aws_namespaces
# }
