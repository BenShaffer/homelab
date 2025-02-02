# Homelab Ansible



## Python Virtual Env

Following best practice, a python virtual env is provided for project dependencies to run Ansible extension commands.
The venv is available in the `./homelab-venv` directory after running `./scripts/setup.sh` from project root.

Add the following to your `settings.json` to use the venv for Ansible extension commands:
```
"ansible.python.interpreterPath": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/.homelab-venv/bin/python"
"ansible.python.activationScript": "<ABSOLUTE_PATH_TO_PROJECT_ROOT>/.homelab-venv/bin/activate"
```

To leverage the venv for CLI commands, simply execute the source command in your CLI window:
```
source ./.homelab-venv/bin/activate
```