terraform {
  cloud {
    organization = "constructions-incongrues"

    workspaces {
      name = "marmite-prod-hcloud"
    }
  }
}