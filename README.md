# Homelab

> This is my homelab repository; it's not meant for production.

## Description

My homelab is quite modest. I'll be buying more RAM in the future, and storage.

**Specs**

- 12 CPU
- 32GB RAM
- 1 Node; T5500 Dell Workstation
- 600GB Storage

The primary purpose is to run my local Kubernetes cluster and Home Assistant.

**Kubernetes**

This cluster serves as a good test bed for new ideas and so it must be able of being rebuilt 
on-demand; I break it all the time. It is mainly used for running my dev workloads and allowing 
my family to access certain app's locally.

Basic app's:

- Traefik
- MetalLB
- OpenFaaS
- ArgoCD (deploys most things)
- Cert-Manager

## Usage

To deploy this system there is some pre-amble before getting to kubernetes.

### Deploying a fresh homelab

This assumes that Proxmox is not installed or running on any devices in your network.

1. Download Proxmox
2. Create USB installer
3. Format a device capable of running Proxmox
4. Start the Proxmox machine, and give it an address that's within my VLAN (pfsense managed)
    *This part is super important; statically assign an IP once you can connect to it*
5. (optional) Install darkmode UI;
   `bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install`

### Creating a decent template

Proxmox isn't all that great when using automation unless your templates have two things done to 
them:

- `qemu-guest-agent` is installed
- `/etc/machine-id` has been truncated

To upload an Ubuntu 22.04 Cloud Image with this done, a script is available, [here](provisioners/proxmox/proxmox).
Follow the README to get this up and running.

Once there is a template on Proxmox it's time to [deploy Kubernetes](#deploying-kubernetes).

## Deploying Home Assistant

Instead of running HA in the cluster, I have chosen to deploy it directly on a VM. Check
out this [comparison](https://www.home-assistant.io/installation/#compare-installation-methods) 
chart to see why I've elected to do it this way.

How to deploy can be found [here](machines/home-assistant)

### Deploying Kubernetes

Once there is a viable template in Proxmox, it's time to deploy the [k3s](https://k3s.io) onto it.

To get started quickly, run `./scripts/bootstrap-kube --with-k3s`. 

For more granular control, run the script `./scripts/install-k3s`. It can take optional arguments,
run `./scripts/install-k3s -h` to see them.

If you've already run Ansible and set up the VM's in proxmox, and want to re-run the kubernetes 
bootstrap then use `./scripts/bootstrap-kube`

**Note**

You may need to install the `ansible-galaxy` requirements first with 
`ansible-galaxy install -r machines/k3s/requirements.yml`

**How it works**

The cluster is deployed using Terraform and Ansible. They are linked together, Terraform creates the
VM's in Proxmox, gets their IP addresses and then outputs them into a directory. Ansible reads from
that directory to inform the playbook. The playbook will deploy *n* number of servers and clients
on to the newly provisioned VM's. This process also deploys several applications onto the cluster
such as ArgoCD, MetalLB and Cert-Manager.

To tear it all down, run `./scripts/install-k3s --destroy`.

## Requirements

- [Proxmox](https://proxmox.com)
- [Ansible](https://ansible.com)
- [Python](https://python.org)
