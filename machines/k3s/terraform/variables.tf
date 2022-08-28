
variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = false
}

variable "pm_host" {
  description = "The hostname or IP of the proxmox server"
  type        = string
}

variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default     = "proxmox"
}

variable "ssh_key" {
  description = "path to local ssh key which will make the ansible connection"
  default = "~/.ssh/id_rsa"
}

variable "ssh_key_full" {
  description = "full ssh key used to make a connection to the node"
}

variable "num_k3s_masters" {
  default = 1
}

variable "num_k3s_masters_mem" {
  default = "4096"
}

variable "num_k3s_nodes" {
  default = 2
}

variable "num_k3s_nodes_mem" {
  default = "4096"
}

variable "template_vm_name" {}

variable "master_ips" {
  description = "List of ip addresses for master nodes"
}

variable "worker_ips" {
  description = "List of ip addresses for worker nodes"
}

variable "networkrange" {
  default = 24
}

variable "gateway" {
  default = "192.168.3.1"
}
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
}
variable "proxmox_api_token_secret" {
  type = string
}
