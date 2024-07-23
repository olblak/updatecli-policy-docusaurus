# READMEe

This repository is an experimentation leveraging https://github.com/updatecli/updatecli/releases/tag/v0.63.0
To maintain shareable Updatecli policies that can be used from their own repository.

Today each docusaurus website has its own set of duplicated policies which become harder to maintain over time.

Running `make help` list all common tasks with this repository

## Requirements

* [Updatecli](https://www.updatecli.io/docs/prologue/installation/) [>=0.63.0]

## How To

This policy is designed to work from GitHub action workflows. this means that before running any Updatecli command, we need the two following environment variables set:

* `GITHUB_TOKEN`: Set to a personal access token
* `GITHUB_ACTOR`: Set to the username associated with the `GITHUB_TOKEN`

Instruction to retrieve your PAT is documented on [manifest-your-personal-access-tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)


**Show Update policy description**

```
updatecli manifest show --experimental ghcr.io/olblak/policies/rancher/docusaurus/<project name>:<version>
```

**Execute Updatecli in dryrun mode**

```
updatecli diff --experimental ghcr.io/olblak/policies/rancher/docusaurus/<project name>:<version>
```

**Execute Updatecli in apply mode**

Please note that to run the following command, your PAT must have enough permission on the target documentation repository.

```
updatecli apply --experimental ghcr.io/olblak/policies/rancher/docusaurus/<project name>:<version>
```

## Release

Push a git tag matching the version of the Policy defined by the field "version" in policy/Policy.yaml

## Contributing

Feel free to:
* report any Updatecli bugs on https://github.com/updatecli/updatecli
* start discussion about potential Updatecli workflow on https://github.com/orgs/updatecli/discussions 

## Links:

* [Updatecli Documentation](https://www.updatecli.io)
