#!/bin/bash
set -e

# Define paths
INSTALL_DIR="/usr/local/bin/pathsense"
SERVICE_FILE="/etc/systemd/system/pathsense_daemon.service"
RC_LOCAL_FILE="/etc/rc.local"

# Stop and disable the service
echo "=== Stopping PathSense service ==="
sudo systemctl stop pathsense_daemon.service || true
sudo systemctl disable pathsense_daemon.service || true

# Remove systemd service file
echo "=== Removing systemd service ==="
sudo rm -f "$SERVICE_FILE"
sudo systemctl daemon-reload

# Remove the installation directory and all its contents
echo "=== Removing installed files ==="
sudo rm -rf "$INSTALL_DIR"

echo "=== Removing PathSense from rc.local ==="
if [ -f "$RC_LOCAL_FILE" ]; then
  sudo sed -i "/pathsense_system/d" "$RC_LOCAL_FILE"
fi

echo "=== Deleting pathsense user and group ==="
sudo userdel pathsense || true
sudo groupdel pathsensegroup || true

echo "=== PathSense has been successfully uninstalled ==="
