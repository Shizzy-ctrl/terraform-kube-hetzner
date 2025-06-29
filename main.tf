locals {
  hcloud_token = var.hcloud_token != "" ? var.hcloud_token : var.hcloud_token_local
}

module "kube-hetzner" {
  providers = {
    hcloud = hcloud
  }
  hcloud_token = local.hcloud_token

  source = "kube-hetzner/kube-hetzner/hcloud"

  cluster_name = var.cluster_name

  ssh_public_key  = file(var.ssh_public_key_path)
  ssh_private_key = file(var.ssh_private_key_path)

  network_region = var.network_region

  control_plane_nodepools = var.control_plane_nodepools

  agent_nodepools = var.agent_nodepools

  initial_k3s_channel    = var.initial_k3s_channel

  automatically_upgrade_os   = var.automatically_upgrade_os
  enable_klipper_metal_lb = var.enable_klipper_metal_lb
  allow_scheduling_on_control_plane = var.allow_scheduling_on_control_plane
}

provider "hcloud" {
  token = local.hcloud_token
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
