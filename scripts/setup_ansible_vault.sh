#!/bin/bash

# Ensure script is always executed at project root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Prompt the user for a password for the vault
echo "Enter a password for the Ansible Vault:"
read -s VAULT_PASSWORD

# Generate the vault password file (to be used later by Ansible)
echo "$VAULT_PASSWORD" > vault_password.txt
chmod 600 vault_password.txt

# List of predefined secret names (add your secret names here)
secret_names=(
    "grafana_notifications_service_account_user"
    "grafana_notifications_service_account_pass"
    "grafana_admin_user"
    "grafana_admin_password"
    "pihole_admin_password"
    "samba_user"
    "samba_pass"
)

# Create a temporary YAML file to hold the secrets
temp_file=$(mktemp)

# Format the secrets as YAML and write to the temporary file
echo "---" > "$temp_file"

# Prompt the user for the values of each secret
for SECRET_NAME in "${secret_names[@]}"; do
    echo -n "Enter value for $SECRET_NAME: "
    read SECRET_VALUE

    # Store the secret in the YAML file
    echo "$SECRET_NAME: $SECRET_VALUE" >> "$temp_file"
done

# Encrypt the temporary file using Ansible Vault
ansible-vault encrypt "$temp_file"

# Move the encrypted file to the desired location
mkdir -p ./playbooks/vars
mv "$temp_file" ./playbooks/vars/secrets.yml
chmod 600 secrets.yml

echo "Secrets have been encrypted and saved to 'secrets.yml'."
