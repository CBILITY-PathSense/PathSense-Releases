#!/bin/bash
set -e

# Define paths
INSTALL_DIR="/usr/local/bin/pathsense"
SERVICE_FILE="/etc/systemd/system/pathsense_daemon.service"
RC_LOCAL_FILE="/etc/rc.local"
PPP_PEERS_DIR="/etc/ppp/peers"
PPP_CHAT_DIR="/etc/chatscripts"

echo "=== Stopping PathSense service ==="
# Stop and disable the service
sudo systemctl stop pathsense_daemon.service || true
sudo systemctl disable pathsense_daemon.service || true

echo "=== Removing systemd service ==="
# Remove systemd service file
sudo rm -f "$SERVICE_FILE"
sudo systemctl daemon-reload

# Remove the installation directory and all its contents
echo "=== Removing installed files ==="
sudo rm -rf "$INSTALL_DIR"
sudo rm -f "$PPP_PEERS_DIR/ais"
sudo rm -f "$PPP_CHAT_DIR/ais_chat"

echo "=== Removing PathSense from rc.local ==="
if [ -f "$RC_LOCAL_FILE" ]; then
  # Remove 'pon ais' and 'pathsense_system' from rc.local
  sudo sed -i "/pon ais/d" "$RC_LOCAL_FILE"
  sudo sed -i "/pathsense_system/d" "$RC_LOCAL_FILE"
fi

echo "=== Deleting pathsense user and group ==="
sudo userdel pathsense || true
sudo groupdel pathsensegroup || true

echo "=== PathSense has been successfully uninstalled ==="
