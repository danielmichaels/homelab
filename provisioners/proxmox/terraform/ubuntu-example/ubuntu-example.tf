// template 200 ubuntu cloud 22.04
resource "proxmox_vm_qemu" "ubuntu-example" {
  count       = 0
  name        = "ubuntu-example"
  desc        = "ubuntu cloud 22.04"
  vmid        = "400"
  target_node = "proxmox"

  // set this to speed up terraform; qemu-guest-agent can cause slow downs without it
  agent = 1

  clone   = "ubuntu-cloud"
  cores   = 2
  sockets = 1
  cpu     = "host"
  memory  = 2048

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
  disk {
    storage = "local-zfs"
    type    = "virtio"
    size    = "20G"
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=dhcp"
  sshkeys   = <<EOF
${var.ssh_key}
EOF
}
