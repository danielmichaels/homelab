# Drone CI

This is a barebones DroneCI setup.

There is still the odd issue, especially with networking - sometimes the drone server is 
unreachable.

```shell
helm repo add drone https://charts.drone.io
helm repo update
```

```shell
# these are demo values
export DRONE_RPC_SECRET="secret" 
export DRONE_GITEA_CLIENT_ID=d5906595-8dd9-47ca-8746-82e7351273e9 
export DRONE_GITEA_CLIENT_SECRET=gto_if5so27kwvjmhfunsp2uyxq2csxi53pkhocagienj5hbcmnyu7la 
kubectl create ns drone
kubectl create secret generic my-drone-secret  --namespace drone \
  --from-literal=DRONE_RPC_SECRET=$DRONE_RPC_SECRET \
  --from-literal=DRONE_GITEA_CLIENT_ID=$DRONE_GITEA_CLIENT_ID \
  --from-literal=DRONE_GITEA_CLIENT_SECRET=$DRONE_GITEA_CLIENT_SECRET 
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
