.PHONY: publish
publish: kubewarden_publish fleet_publish epinio_publish ## Publish docusaurus test

.PHONY: show
show: show.kubewarden show.epinio show.fleet ## Show display generated Updatecli manifest for each project

## Epinio related targets

.PHONY: epinio_publish
epinio_publish: ## Publish Epinio version of the policy
	./ci/release.bash epinio

.PHONY: epinio_show
epinio_show: ## epinio_show shows generated Updatecli manifest for Epinio documentation website
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/epinio.yaml

.PHONY: epinio_test
epinio_test: ## epinio_test shows a diff of what would be changed by Updatecli on the Epinio website
	updatecli diff --experimental --config policy/updatecli.d --values policy/values.d/epinio.yaml

## Kubewarden related target

.PHONY: kubewarden_publish
kubewarden_publish: ## Publish Kubewarden version of the policy
	./ci/release.bash kubewarden

.PHONY: kubewarden_show
kubewarden_show: ## kubewarden_show shows generated Updatecli manifest for Kubewarden documentation website
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/kubewarden.yaml

.PHONY: kubewarden_test
kubewarden_test: ## kubewarden_test shows a diff of what would be changed by Updatecli on the Kubewarden website 
	updatecli diff --experimental --config policy/updatecli.d --values policy/values.d/kubewarden.yaml

# Fleet related targets

.PHONY: fleet_publish
fleet_publish: ## Publish Fleet version of the policy
	./ci/release.bash fleet

.PHONY: fleet_show
fleet_show: ## fleet_show shows generated Updatecli manifest for Fleet documentation website
	updatecli manifest show --experimental --config policy/updatecli.d --values policy/values.d/fleet.yaml

.PHONY: fleet_test
fleet_test: ## fleet_test shows a diff of what would be changed by Updatecli on the Fleet website
	updatecli diff --experimental --config policy/updatecli.d --values policy/values.d/fleet.yaml

.PHONY: help
help: ## Show this Makefile's help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

