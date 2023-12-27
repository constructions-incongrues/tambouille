# The versions.tf file in Terraform is used to specify the required version of the Terraform CLI and any required providers for your Terraform configuration.

terraform {

  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.51.1"
    }
  }
}