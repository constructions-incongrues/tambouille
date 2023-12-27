terraform {
  cloud {
    organization = "constructions-incongrues"

    workspaces {
      name = "marmite-prod-hcloud"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_api_token
}

provider "swarm" {}
