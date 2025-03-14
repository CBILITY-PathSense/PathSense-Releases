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

echo "=== Removing installed files ==="
# Remove the installation directory and all its contents
sudo rm -rf "$INSTALL_DIR"

echo "=== Deleting pathsense user ==="
sudo userdel pathsense
sudo rm -f /etc/udev/rules.d/99-camera.rules
sudo rm -f /etc/udev/rules.d/99-audio.rules

echo "=== PathSense has been successfully uninstalled ==="
