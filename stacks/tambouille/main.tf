# The main.tf file in Terraform is a required configuration file that defines the infrastructure resources that should be created, modified or deleted. This file is used to declare the resources that make up your infrastructure in a declarative way.

resource "tfe_workspace" "marmite-prod-hcloud" {
  name         = "marmite-prod-hcloud"
  organization = data.tfe_organization.constructions-incongrues.name
  tag_names = [ "marmite", "prod", "hcloud" ]
  auto_apply = true
}