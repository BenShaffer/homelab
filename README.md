# Homelab Ansible

This repository contains Ansible config, inventory, and playbooks to configure a homelab.
Scripts are provided for easy setup.

## Setup and Exec

To setup the environment, run the `./scripts/configure_env.sh` script.
In order to execute the playbook, run the `./scripts/run.sh` script.

## Ansible Collections

Some tasks and roles require external definitions (collections) to run. These are managed by the
`requirements.yml` defining the collections to install and the `./scripts/setup_ansible_collections.sh`
script installing the necessary collections via the `ansible-galaxy` command

## Ansible User / SSH Configs

In order for Ansible to have permissions to the hosts defined, a user and SSH key must be
created on each of the hosts targeted by `homelab` playbooks.

Ensure the variables in the script match the desired state and run the `./scripts/setup_ansible_user.sh`
script to configure each server with the necessary permissions to execute Ansible playbooks.

## Python Virtual Env

Following best practice, a python virtual env is provided for project dependencies to run Ansible
extension commands. The venv is available in the `./homelab-venv` directory after running
`./scripts/setup_python_env.sh` from project root.

Add the following to your `settings.json` to use the venv for Ansible extension commands:
```
"ansible.python.interpreterPath": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/.homelab-venv/bin/python"
"ansible.python.activationScript": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/.homelab-venv/bin/activate"
```

To leverage the venv for CLI commands, simply execute the source command in your CLI window:
```
source ./.homelab-venv/bin/activate
```

## Secrets

Some values cannot be checked into Git, so they are configured as secrets. These secrets can
be created by running the `./scripts/setup_ansible_vault.sh` script and inputting the requested
password and secrets. The files will be used to populate the playbook with secret values.