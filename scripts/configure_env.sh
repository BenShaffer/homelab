#!/bin/bash

# Ensure script is always executed at project root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

./scripts/setup_python_env.sh
./scripts/setup_ansible_collections.sh
./scripts/setup_ansible_user.sh
./scripts/setup_ansible_vault.sh
