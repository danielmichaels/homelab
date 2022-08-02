# k8s at home

This is my repository for a local kubernetes cluster.

**TODO**

- setup ArgoCD
- drone/woodpecker etc for CI
- expose an ingress - inlets, frp, clash (research topic)

## Which k8s

This uses [k3s](/k3s), and specifically installs it using:

**Install k3s**
```shell
curl -sfL https://get.k3s.io | \
INSTALL_K3S_CHANNEL=latest \
INSTALL_K3S_SELINUX_WARN=true \
INSTALL_K3S_SKIP_SELINUX_RPM=true \
K3S_KUBECONFIG_MODE="644" \
sh -
```

OR use [k3sup](https://github.com/alexellis/k3sup)

```shell
export USER=foo
export IP=1.2.3.4
k3sup install --ip $IP --user $USER \
 --local-path=./kube-remote \
  --k3s-extra-args '--write-kubeconfig-mode=644'
```

**Uninstall k3s**
```shell
/usr/local/bin/k3s-uninstall.sh
```

## Configuration

All the extra configuration files can be found the [k3s](/k3s) directory within this repo.

## Local hosts

This is not setup for use outside localhost, yet. To get these working `/etc/hosts` must be updated

```shell
<k3a.io/internal-ip> dashboard.k8s.dansult.space 
<k3a.io/internal-ip> whoami.k8s.dansult.space
<k3a.io/internal-ip> git.k8s.dansult.space
```
