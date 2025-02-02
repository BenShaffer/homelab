#!/bin/bash

# Ensure script is always executed at project root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

ansible-playbook ./playbooks/homelab.yml --flush-cache