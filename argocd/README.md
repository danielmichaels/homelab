# ArgoCD

## Quick Start

```shell
kubectl create namespace argocd
kubectl apply -f argo-install.yml -n argocd
```

```shell
# setup load balancer
#kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
# traefik ingress
kubectl apply -f traefik-ingress.yml -n argocd
```

```shell
# get login password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```


**Scorch earth**
```shell
kubectl delete namespace argocd
```
