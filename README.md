# terraform-datadog-modules
KO Technologies Terraform Datadog Modules<br />

Use our modules to make a success of Datadog configuration. Our modules harness the power of Terraform MAP variable to create the respective resources in Datadog.<br />



```
#Using the provider / modules, we recommend you use the following environment variables.

provider "datadog" {
  # Use the environment variables to authenticate
  # export DD_HOST=""
  # export DD_API_KEY=
  # export DD_APP_KEY=
}
```

# Generate README Documents
```
cd <MODULE>
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.20.0 markdown /terraform-docs > README.md
```

# Terragrunt
If you're using Terragrunt or using CI/CD you might find that the module reference needs to be simlar to the example below.
```
...
source = "tfr:///KOTechnologiesLtd/modules/datadog//modules/api-key?version=1.0.2"
...
```
# Modules <br />
### [Child Organizations](modules/child-organizations)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/child-organizations"
child_organization = {
    CO1 = {
      name = "CO1"
    },
    CO2 = {
      name = "CO2"
    },
    CO3 = {
      name = "CO3"
    }
  }
  ...
```
### [Teams](modules/teams)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/teams"
team = {
    Team1 = {
      name = "Team1"
      description = "Team one"
      handle = "teamone"
    },
    Team2 = {
      name = "Team2"
      description = "Team two"
      handle = "teamtwo"
    },
  }
  ...
```
### [API Keys](modules/api-keys)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/api-keys"
api_key = {
    key1 = {
      name = "EC2"
    },
    key2 = {
      name = "Lambda"
    },
  }
  ...
```
### [DashboardsJson](modules/dashboards-json)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/dashboards-json"
  dashjsonfiles = fileset(".", "./dashboard_json/*.json")
  ...
```
### [MonitorsJson](modules/monitors-json)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/monitors-json"
  monjsonfiles = fileset(".", "./monitors_json/*.json")
  ...
```
### [Datadog Integration AWS Account](modules/datadog_integration_aws_account)<br />
```
...
source = "git::git@github.com:KOTechnologiesLtd/terraform-datadog-modules.git//modules/datadog_integration_aws_account"
  ddintegrationaws = {
                        AWSAccountSimple = {
                          aws_account_id = "AWSAccountSimple",
                          metrics_config = {}
                        },
                        AWSAccountCustom = {
                          account_tags = ["AWSAccountCustomName", "AWSAccountCustomID"],
                          aws_account_id = "AWSAccountCustomID",
                          aws_regions = ["eu-west-2"]
                          metrics_config = {
                            tag_filters = {
                              lambda = {namespace = "AWS/Lambda", tags = ["datadog:true"]},
                              ec2 = {namespace = "AWS/EC2", tags = ["datadog:true"]},
                             }
                             ns_filters_include_only = ["AWS/Route53", "AWS/S3", "AWS/TransitGateway", "AWS/EC2", "AWS/RDS", "AWS/AutoScaling", "AWS/Backup", "AWS/ELB", "AWS/EC2/API", "AWS/EC2/InfrastructurePerformance", "AWS/EC2Spot"]
                            },
                        },
                      }

  ...
```