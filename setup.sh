#!/bin/bash

python3 -m venv homelab-venv
source ./homelab-venv/bin/activate

# Install python tools onto virtual Python env
python3 -m pip install ansible-dev-tools