.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

#KUBECONFIG = $(shell pwd)/metal/kubeconfig.yaml
KUBECONFIG = $(HOME)/.kube/proxmox-config
KUBE_CONFIG_PATH = $(KUBECONFIG)

#default: metal bootstrap external wait post-install
default: bootstrap

#configure:
#	./scripts/configure
#	git status
argocd-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
#metal:
	#make -C metal


bootstrap:
	make -C bootstrap
#
#external:
#	make -C external
#
#wait:
#	./scripts/wait-main-apps
#
#post-install:
#	@./scripts/hacks

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

#test:
#	make -C test
#
#dev:
#	make -C metal cluster env=dev
#	make -C bootstrap
#
#docs:
#	docker run \
#		--rm \
#		--interactive \
#		--tty \
#		--publish 8000:8000 \
#		--volume $(shell pwd):/docs \
#		squidfunk/mkdocs-material
#
#git-hooks:
#	pre-commit install
