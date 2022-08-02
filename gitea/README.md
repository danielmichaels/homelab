# Gitea

This will deploy a gitea instance to the cluster using `helm`.

Hosted at [git.k8s.dansult.space](http://git.k8s.dansult.space) - requires hosts file entry

## Install

```shell
helm repo add gitea-charts https://dl.gitea.io/charts/
kubectl create namespace gitea
```

```shell
helm upgrade --install --atomic --timeout=200s gitea gitea-charts/gitea -n gitea -f values.yml \
--set gitea.admin.password=SomethingHardToGuess
```

## Docker 

Gitea now supports packages registries. I am really excited about this!

To push to `gitea`

```shell
echo <PASSWORD> | docker login -u <username> --password-stdin
docker push git.k8s.dansult.space/<username>/<image>
# and pull with
docker pull git.k8s.dansult.space/<username>/<image>
```
