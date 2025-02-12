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