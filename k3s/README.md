# k3s

[k3s](https://rancher.com/docs/k3s/latest/en/) is my Kubernetes distro of choice. It can be 
installed almost anywhere, handle production load and be setup in a cluster.

This directory contains `k3s` specific setup files.

## Metallb

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```shell
helm upgrade --install metallb bitnami/metallb -n metallb
```
