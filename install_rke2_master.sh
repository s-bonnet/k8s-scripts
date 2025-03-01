#!/bin/bash

# Script to install a master node of a k8s cluster
# To be run as sudo

# Download and execute the installation script of rke2
curl -sfL https://get.rke2.io | sh -

# Enable the rke2-server service
systemctl enable rke2-server.service

# Start the rke2-server service
systemctl start rke2-server.service

# Optional: display logs
# journalctl -u rke2-server -f

# Notes
# - add /var/lib/rancher/rke2/bin/ to PATH to run kubectl, crictl binaries 
# - export KUBECONFIG=/etc/rancher/rke2/rke2.yaml to use the generated kube config file
# - some cleaning scripts are installed at /usr/bin/ (rke2-killall.sh & rke2-uninstall.sh)
# - the token for worker nodes is available at /var/lib/rancher/rke2/server/node-token

# Source: https://docs.rke2.io/install/quickstart
