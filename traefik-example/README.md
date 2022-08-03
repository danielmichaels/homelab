# Traefik and ingress examples

## Whoami

This serves as a good demonstration of how to setup a simple HTTP ingress which
will route traffic between containers and depending on the endpoint; `/foo` and `/bar`.

**install**

```shell
kubectl apply -f whoami/whoami.yml
```

**delete**

```shell
kubectl delete namespace whoami
```
