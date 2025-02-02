#!/bin/bash

# Create Python virtual env and load shell into env
python3 -m venv .homelab-venv
source ./.homelab-venv/bin/activate

# Install Python tools onto virtual Python env
python3 -m pip install ansible-dev-tools