# OpenFaaS

## Setup

```shell
kubectl apply -f openfaas-figlet-dep.yaml,openfaas-figlet-svc.yaml
```

**Deletion**

```shell
kubectl delete deployment/open-faas
```

## Run it

Here's simple example of it in action.

```shell
echo -n "I like $(uname)" | curl --data-binary @- http://127.0.0.1:31111
```
