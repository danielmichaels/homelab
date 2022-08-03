# Woodpecker CI

Woodpecker is a community driven fork of DroneCI. 

## Setup

Wookpecker provides a `helm` install option.

Add the `helm` repo
```shell
helm repo add woodpecker https://woodpecker-ci.org/
```

Create secrets
```shell
# example id and secrets
kubectl create namespace woodpecker
kubectl create secret generic woodpecker-secret \
  --namespace woodpecker \
  --from-literal=WOODPECKER_AGENT_SECRET=$(openssl rand -hex 32)

kubectl create secret generic woodpecker-gitea-client \
  --namespace woodpecker \
  --from-literal=WOODPECKER_GITEA_CLIENT=622321c6-8da1-4286-b5da-69c932f937ce

kubectl create secret generic woodpecker-gitea-secret \
  --namespace woodpecker \
  --from-literal=WOODPECKER_GITEA_SECRET=gto_httbjryvrlatwpqskcajrjk7zryfqky5fdezlqtu4a2euqbomixa
```

Install the server
```shell
# Install
helm upgrade --install woodpecker-server --namespace woodpecker woodpecker/woodpecker-server \
-f server/values.yml
```

Install the agent
```shell
# Install
helm upgrade --install woodpecker-agent --namespace woodpecker woodpecker/woodpecker-agent \
-f agent/values.yml
```

Uninstall
```shell
# Uninstall
helm delete woodpecker-server -n woodpecker
# Uninstall
helm delete woodpecker-agent -n woodpecker

kubectl delete namespace woodpecker
```
