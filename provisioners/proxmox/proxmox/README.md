# Provision cloud templates

The script within will create a Proxmox template ready for use in terraform.
It will install the critical package `qemu-guest-agent` and reset the `/etc/machine-id`.
Without these, provisioning new VM's on Proxmox via Terraform and Ansible is a pain in the neck.
For instance, without `qemu-guest-agent` we cannot determine the IP address of the VM within
Proxmox programmatically. Also, if the machine-id is not reset in the template, every cloned
VM will get the same `machine-id` which causes all sorts of trouble; the worst being they all get
the same IP address.

> In the future, Packer or some other tool would help to standardise or remove this manual script.

## Usage

1. SCP the script onto the Proxmox node.
   `scp * proxmox:~/`
2. Either SSH onto the node, or run the script over SSH.
   `ssh <proxmox> && ./<script>`

This will start the script and result in a template being created on the node ready for use.

The fields can be updated manually on the node, or here and tracked in source control. Note the
name of the template and if its changed update the Terraform components.
