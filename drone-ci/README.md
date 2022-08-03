# Drone CI

```shell
helm repo add drone https://charts.drone.io
helm repo update
```

```shell
kubectl create ns drone
#kubectl create secret generic my-drone-secret  --namespace drone \
#  --from-literal=DRONE_RPC_SECRET=$DRONE_RPC_SECRET \
#  --from-literal=DRONE_GITEA_CLIENT_ID=$DRONE_GITEA_CLIENT_ID \
#  --from-literal=DRONE_GITEA_CLIENT_SECRET=$DRONE_GITEA_CLIENT_SECRET 
```

```shell
helm upgrade --install drone drone/drone --namespace drone -f values.yml
```

**install the runners**
```shell
helm upgrade --install drone-runner-kube drone/drone-runner-kube -n drone -f runner/values.yml
```

**Scorch earth**
```shell
helm delete drone --namespace drone
helm delete drone-runner-kube -n drone
kubectl delete namespace drone
```
