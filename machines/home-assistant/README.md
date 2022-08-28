# Home Assistant

This repo holds the home-assistant related setup and maintenance guides.

Home assistant is running on a server in the local Proxmox instance.

## Installation

1. Step 1: Update proxmox
    - `bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install.sh)"`
2. Install HAOS
    - `bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/vm/haos-vm-v4.sh)"`

## Helpful HA links

- <https://github.com/tteck/Proxmox>
- <https://community.home-assistant.io/t/installing-home-assistant-os-using-proxmox-7/201835>
