hcloud_token_local = "<Hetzner token here>"

cluster_name = "cluster"
ssh_public_key_path  = "~/.ssh/id_ed25519.pub"
ssh_private_key_path = "~/.ssh/id_ed25519"
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

initial_k3s_channel = "v1.29"
automatically_upgrade_os = false
enable_klipper_metal_lb = true
allow_scheduling_on_control_plane = true
