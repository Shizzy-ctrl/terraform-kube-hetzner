locals {
  hcloud_token = "<Hetzner token here>"
}

module "kube-hetzner" {
  providers = {
    hcloud = hcloud
  }
  hcloud_token = var.hcloud_token != "" ? var.hcloud_token : local.hcloud_token

  source = "kube-hetzner/kube-hetzner/hcloud"

  cluster_name = "cluster"

  ssh_public_key  = file("~/.ssh/id_ed25519.pub")
  ssh_private_key = file("~/.ssh/id_ed25519")

  network_region = "eu-central"

  control_plane_nodepools = [
    {
      name        = "cp"
      server_type = "cx32"
      location    = "fsn1"
      labels      = []
      taints      = []
      count       = 1
    }
  ]

  agent_nodepools = [
    {
      name        = "node"
      server_type = "cx32"
      location    = "fsn1"
      labels      = []
      taints      = []
      count       = 1
    }
  ]


  initial_k3s_channel    = "v1.29"

  automatically_upgrade_os   = false
  enable_klipper_metal_lb = true
  allow_scheduling_on_control_plane = true
}

provider "hcloud" {
  token = var.hcloud_token != "" ? var.hcloud_token : local.hcloud_token
}

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.43.0"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
  default   = ""
}

output "kubeconfig" {
  value     = module.kube-hetzner.kubeconfig
  sensitive = true
}
