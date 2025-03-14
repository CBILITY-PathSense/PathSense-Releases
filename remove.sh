#!/bin/bash
set -e

# Define paths
INSTALL_DIR="/usr/bin/pathsense"
SERVICE_FILE="/etc/systemd/system/pathsense_daemon.service"

echo "=== Stopping PathSense service ==="
# Stop and disable the service
sudo systemctl stop pathsense_daemon.service
sudo systemctl disable pathsense_daemon.service

echo "=== Removing systemd service ==="
# Remove systemd service file
sudo rm -f "$SERVICE_FILE"
sudo systemctl daemon-reload

# Remove the installation directory and all its contents
echo "=== Removing installed files ==="
sudo rm -rf "$INSTALL_DIR"

echo "=== Deleting pathsense user ==="
sudo userdel pathsense
sudo groupdel pathsensegroup

echo "=== PathSense has been successfully uninstalled ==="
