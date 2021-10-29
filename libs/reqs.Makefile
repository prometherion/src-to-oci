kind 			:= $(shell command -v kind 2> /dev/null)
ytt 			:= $(shell command -v ytt 2> /dev/null)
kbld 			:= $(shell command -v kbld 2> /dev/null)
kapp 			:= $(shell command -v kapp 2> /dev/null)
kubectl 	:= $(shell command -v kubectl 2> /dev/null)
buildkit_cli_url ?= https://github.com/vmware-tanzu/buildkit-cli-for-kubectl/releases/download/v0.1.4/darwin-v0.1.4.tgz

.PHONY: reqs/cluster
reqs/cluster:
	$(kind) create cluster 2> /dev/null || true

.PHONY: reqs/buildkit-for-kubectl
reqs/buildkit-for-kubectl:
	{ hash kubectl-build && hash kubectl-buildkit; } \
		|| curl -sL $(buildkit_cli_url) | tar -C /usr/local/bin -xvf -

.PHONY: reqs/cluster-registry
reqs/cluster-registry:
	$(kapp) deploy --yes -a registry -f ./config/registry/cluster-registry.yml
