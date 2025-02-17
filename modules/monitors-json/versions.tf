terraform {
  required_version = ">= 1.0.0"
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.54.0"
    }
    assert = {
      source  = "hashicorp/assert"
      version = "0.15.0"
    }
  }
}
