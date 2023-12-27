# The versions.tf file in Terraform is used to specify the required version of the Terraform CLI and any required providers for your Terraform configuration.

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker",
      version = "~> 3.0.2"
    }
    hcloud = {
      source  = "hetznercloud/hcloud",
      version = "~> 1.44.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.1"
    }
    swarm = {
      source  = "aucloud/swarm"
      version = "~> 1.2"
    }
  }
}