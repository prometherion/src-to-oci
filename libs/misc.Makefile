.PHONY: cluster
cluster: kind

.PHONY: kind
kind:
	@$(kind) create cluster 2> /dev/null || true

.PHONY: cleanup
cleanup:
	@$(kapp) delete --yes -a $(APP)

.PHONY: purge
purge: cleanup
	@$(kind) delete cluster
