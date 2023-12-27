# The main.tf file in Terraform is a required configuration file that defines the infrastructure resources that should be created, modified or deleted. This file is used to declare the resources that make up your infrastructure in a declarative way.

resource "hcloud_ssh_key" "terraform" {
  name       = var.ssh_key_name
  public_key = var.ssh_key_public
}

resource "hcloud_network" "cluster" {
  ip_range = "10.0.0.0/8"
  name     = "cluster"
}

resource "hcloud_network_subnet" "nodes" {
  type         = "cloud"
  network_zone = "eu-central"
  network_id   = hcloud_network.cluster.id
  ip_range     = "10.0.1.0/24"
}

data "hcloud_server_type" "node" {
  name = var.cluster_hcloud_server.server_type
}

data "hcloud_image" "node" {
  name              = "docker-ce"
  with_architecture = data.hcloud_server_type.node.architecture
}

resource "hcloud_server" "managers" {
  count = (
    var.cluster_node_pools.managers
  )

  name        = format("node-%02d", count.index + 1)
  image       = data.hcloud_image.node.id
  server_type = var.cluster_hcloud_server.server_type
  location    = var.cluster_hcloud_server.location
  backups     = var.cluster_hcloud_server.backups
  ssh_keys = [ hcloud_ssh_key.terraform.name ]
  labels = merge(
    var.cluster_hcloud_server.labels,
    var.platform_identifiers,
    { role = "manager" }
  )

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  network {
    network_id = hcloud_network.cluster.id
    ip = "10.0.1.${count.index + 1}"
  }

  depends_on = [
    hcloud_network_subnet.nodes
  ]
}
