# The variables.tf file in Terraform is used to define input variables for your Terraform configuration. Input variables allow you to parameterize your infrastructure resources, making your configuration more flexible and reusable.
variable "hcloud_api_token" {
  description = "Hetzner Cloud API Token"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key name"
  type        = string
  default     = "terraform"
}

variable "ssh_key_public" {
  description = "Public SSH key contents"
  type        = string
}

variable "ssh_key_private" {
  description = "Private SSH key contents"
  type        = string
  sensitive   = true
}

variable "platform_identifiers" {
  description = "Platform-wide identification labels"

  type = object({
    organization = string
    domain       = string,
    system       = string,
    application  = string
  })

  default = {
    application = "marmite"
    domain = "pastis-hosting.net"
    organization = "constructions-incongrues"
    system = "tambouille"
  }
}

variable "cluster_hcloud_server" {
  description = "Node servers configuration for hcloud provider"

  type = object({
    server_type = string
    location    = string
    backups     = bool
    labels      = map(string)
  })

  default = {
    server_type = "cx11"
    location    = "nbg1"
    backups     = false
    labels      = {}
  }
}

variable "cluster_node_pools" {
  type = object({
    managers = number,
    bastions = number
  })

  default = {
    managers = 3
    bastions = 1
  }
}
