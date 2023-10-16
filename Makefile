

.PHONY: publish
publish: publish_kubewarden publish_fleet publish_epinio ## Publish docusaurus test

.PHONY: publish_kubewarden
publish_kubewarden: ## Publish Kubewarden version of the policy
	cd policy && \
	updatecli manifest push --experimental -t ghcr.io/olblak/policies/rancher/docusaurus/kubewarden --config updatecli.d --values values.d/kubewarden.yaml .

.PHONY: publish_fleet
publish_fleet: ## Publish Fleet version of the policy
	cd policy && \
	updatecli manifest push --experimental -t ghcr.io/olblak/policies/rancher/docusaurus/fleet --config updatecli.d --values values.d/fleet.yaml .

.PHONY: publish_epinio
publish_epinio: ## Publish Epinio version of the policy
	cd policy && \
	updatecli manifest push --experimental -t ghcr.io/olblak/policies/rancher/docusaurus/epinio --config updatecli.d --values values.d/epinio.yaml .

PHONY: help
help: ## Show this Makefile's help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: show
show: show.kubewarden show.epinio show.fleet

.PHONY: show_kubewarden
show_kubewarden:
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/kubewarden.yaml

.PHONY: show_fleet
show_fleet:
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/fleet.yaml

.PHONY: show_epinio
show.epinio:
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/epinio.yaml
