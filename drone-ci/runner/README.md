# Drone CI runner

```shell
helm upgrade --install drone drone/drone-runner-kube -n drone -f values.yml
```

```shell
helm delete drone-runner-kube -n drone
```
