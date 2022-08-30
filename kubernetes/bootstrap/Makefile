.POSIX:

default: namespace argocd core

argocd/charts: argocd/Chart.yaml
	cd argocd \
		&& helm dependency update

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

.PHONY: argocd
argocd: argocd/charts
	cd argocd && \
		./apply

.PHONY: core
core:
	cd core && \
		./apply
