# Shaffer Homelab Ansible Project

## Included content/ Directory Structure

The directory structure follows best practices recommended by the Ansible community. Feel free to customize this template according to your specific project requirements.

```
 ansible-project/
 |── .devcontainer/
 |    └── docker/
 |        └── devcontainer.json
 |    └── podman/
 |        └── devcontainer.json
 |    └── devcontainer.json
 |── .vscode/
 |    └── extensions.json
 |── collections/
 |   └── requirements.yml
 |   └── ansible_collections/
 |       └── project_org/
 |           └── project_repo/
 |               └── README.md
 |               └── roles/sample_role/
 |                         └── README.md
 |                         └── tasks/main.yml
 |── inventory/
 |   └── groups_vars/
 |   └── host_vars/
 |   └── hosts.yml
 |── ansible-navigator.yml
 |── ansible.cfg
 |── devfile.yaml
 |── linux_playbook.yml
 |── network_playbook.yml
 |── README.md
 |── site.yml
```

## Compatible with Ansible-lint

Tested with ansible-lint >=24.2.0 releases and the current development version of ansible-core.

## Python Virtual Env

Following best practice, a python virtual env is provided for project dependencies to run Ansible extension commands.
The venv is available in the `./homelab-venv` directory after running `setup.sh` from project root.

Add the following to your `settings.json` to use the venv for Ansible extension commands:
```
"ansible.python.interpreterPath": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/homelab-venv/bin/python"
"ansible.python.activationScript": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/homelab-venv/bin/activate"
```

To leverage the venv for CLI commands, simply execute the source command in your CLI window:
```
source ./homelab-venv/bin/activate
```