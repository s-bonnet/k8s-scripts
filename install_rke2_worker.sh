#!/bin/bash

# Script to install a worker node on a k8s cluster
# To be run as sudo

# Download and execute the installation script of rke2
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh -

# Enable the rke2-agent service
systemctl enable rke2-agent.service

# Configure the rke2-agent service
mkdir -p /etc/rancher/rke2/
vim /etc/rancher/rke2/config.yaml
# Copy the following content :
# server: https://<server>:9345
# token: <token from server node>

# Start the rke2-agent service
systemctl start rke2-agent.service

# Optional: display logs
# journalctl -u rke2-agent -f

# Source: https://docs.rke2.io/install/quickstart
