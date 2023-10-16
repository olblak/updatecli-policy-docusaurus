#!/usr/bin/env bash

set -euo pipefail

CURRENT_TAG=$(git describe --tags)
POLICY_VERSION=$(grep 'version: ' policy/Policy.yaml | sed 's/version: //')
POLICY_NAME=$1

echo "Prerelease check - validating that current tag equal Policy version"

if [ ! "$CURRENT_TAG" = "$POLICY_VERSION" ]; then
    echo "Policy version '$POLICY_VERSION' doesn't match current tag '$CURRENT_TAG'"
    exit 1
else 
    echo "Policy '$POLICY_NAME:$POLICY_VERSION' is going to be published to ghcr.io/olblak/policies/rancher/docusaurus/$POLICY_NAME"
    pushd policy
    updatecli manifest push --experimental -t "ghcr.io/olblak/policies/rancher/docusaurus/$POLICY_NAME" --config "updatecli.d" --values "values.d/$POLICY_NAME.yaml" .
    popd
fi

