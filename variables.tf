variable "hcloud_token" {
  description = "Hetzner Cloud API token (overrides tfvars if set)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "hcloud_token_local" {
  description = "Hetzner Cloud API token (default, from tfvars)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "cluster_name" {
  description = "K3s cluster name"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key"
  type        = string
}

variable "network_region" {
  description = "Hetzner Cloud network region"
  type        = string
}

variable "control_plane_nodepools" {
  description = "Nodepool for control plane"
  type        = list(object({
    name        = string
    server_type = string
    location    = string
    labels      = list(string)
    taints      = list(string)
    count       = number
  }))
}

variable "agent_nodepools" {
  description = "Nodepool for agents"
  type        = list(object({
    name        = string
    server_type = string
    location    = string
    labels      = list(string)
    taints      = list(string)
    count       = number
  }))
}

variable "initial_k3s_channel" {
  description = "K3s channel"
  type        = string
}

variable "automatically_upgrade_os" {
  description = "Automatic OS upgrade"
  type        = bool
}

variable "enable_klipper_metal_lb" {
  description = "Enable MetalLB"
  type        = bool
}

variable "allow_scheduling_on_control_plane" {
  description = "Allow scheduling on control plane"
  type        = bool
}
