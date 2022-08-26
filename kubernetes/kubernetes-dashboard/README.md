# Kubernetes Dashboard

This creates the easy to setup and use Kubernetes Dasboard.

## Setup

*updating images are done manually*

```sh
kubectl apply -f dashboard.yml
kubectl apply -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml \
-f dashboard-ingress.yml
```

## Access the Dashboard

The dashboard only supports token auth. Therefore, you must get the token from the kubernetes 
secret.

```shell
# 1.24 +
kubectl -n kubernetes-dashboard create token admin-user
```
```sh
# 1.23 and below
kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'
```

## Deletion

```sh
kubectl delete ns kubernetes-dashboard
kubectl delete clusterrolebinding kubernetes-dashboard
kubectl delete clusterrolebinding admin-user
kubectl delete clusterrole kubernetes-dashboard
```
