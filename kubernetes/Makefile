.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

KUBECONFIG = $(HOME)/.kube/proxmox-config
KUBE_CONFIG_PATH = $(KUBECONFIG)

#default: metal bootstrap external wait post-install
default: bootstrap


argocd-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

bootstrap:
	make -C bootstrap

tools:
	@docker run \
		--rm \
		--interactive \
		--tty \
		--network host \
		--env "KUBECONFIG=${KUBECONFIG}" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--volume $(shell pwd):$(shell pwd) \
		--volume ${HOME}/.ssh:/root/.ssh \
		--volume ${HOME}/.terraform.d:/root/.terraform.d \
		--volume homelab-tools-cache:/root/.cache \
		--volume homelab-tools-nix:/nix \
		--workdir $(shell pwd) \
		nixos/nix nix-shell
