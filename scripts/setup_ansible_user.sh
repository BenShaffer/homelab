#!/bin/bash

# Ensure script is always executed at project root
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Define the target servers
SERVERS=("urculoworm.dev" "pi.hole")  # Replace with your actual server IPs or hostnames
USERNAME="ansible"
SSH_KEY_FOLDER="./.ssh"
SSH_KEY_PATH="$SSH_KEY_FOLDER/ansible"
SUDO_USER="bcsh" # Replace with your actual server sudoer

# Prompt for the sudo password once
read -s -p "Enter sudo password for $SUDO_USER: " SUDO_PASS
echo -e "\nStarting setup...\n"

# Generate SSH key if not exists
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Generating SSH key..."
    mkdir $SSH_KEY_FOLDER
    ssh-keygen -t ed25519 -C "Homelab Ansible" -f "$SSH_KEY_PATH" -N ""
    chmod 600 "$SSH_KEY_PATH"
else
    echo "SSH key already exists. Skipping key generation."
fi

PUBLIC_KEY=$(cat "$SSH_KEY_PATH.pub")

# Loop through servers
for SERVER in "${SERVERS[@]}"; do
    echo -e "\nConfiguring $SERVER...\n"

    # Use SSH to connect and execute commands with sudo
    echo "$SUDO_PASS" | sudo -S ssh -t "$SUDO_USER@$SERVER" <<EOF
        # Add the user if they don't already exist
        echo "$SUDO_PASS" | sudo -S useradd -m -s /bin/bash $USERNAME || echo "User $USERNAME already exists"

        echo "Creating SSH directory for $USERNAME..."
        echo "$SUDO_PASS" | sudo -S mkdir -p /home/$USERNAME/.ssh

        # Setting correct permissions for .ssh directory
        echo "Setting correct permissions for .ssh directory..."
        echo "$SUDO_PASS" | sudo -S chmod 700 /home/$USERNAME/.ssh

        echo "Replacing authorized_keys for $USERNAME with SSH public key..."
        echo "$SUDO_PASS" | sudo -S sh -c "echo '$PUBLIC_KEY' > /home/$USERNAME/.ssh/authorized_keys"

        echo "Setting correct permissions for authorized_keys..."
        echo "$SUDO_PASS" | sudo -S chmod 600 /home/$USERNAME/.ssh/authorized_keys

        echo "Ensuring the correct ownership of the SSH directory..."
        echo "$SUDO_PASS" | sudo -S chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

        echo "Adding $USERNAME to sudoers with no password prompt..."
        echo "$SUDO_PASS" | sudo -S sh -c "echo '$USERNAME ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/$USERNAME"

        echo "Server $SERVER setup completed!"
EOF

    echo "Testing SSH access to $SERVER as $USERNAME..."
    ssh -i "$SSH_KEY_PATH" "$USERNAME@$SERVER" "echo 'SSH key authentication successful for $USERNAME@$SERVER'"
done

echo -e "\nSetup complete!"
