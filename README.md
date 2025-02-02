# Homelab Ansible

This repository contains Ansible config, inventory, and playbooks to configure a homelab.
Scripts are provided for easy setup.

## Ansible User / SSH Configs

In order for Ansible to have permissions to the hosts defined, a user and SSH key must be
created on each of the hosts targeted by `homelab` playbooks.

Ensure the variables in the script match the desired state and run the `setup_ansible_user.sh`
to configure each server with the necessary permissions to execute Ansible playbooks.

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