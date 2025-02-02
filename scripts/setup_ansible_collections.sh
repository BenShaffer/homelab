#!/bin/bash

# Ensure script is always executed at project root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Install required Ansible collections
ansible-galaxy collection install -r requirements.yml