#!/bin/bash
set -e

# Define variables
PPP_PEERS_DIR="/etc/ppp/peers"
PPP_CHAT_DIR="/etc/chatscripts"
RC_LOCAL_FILE="/etc/rc.local"

# Remove modem configuration files
echo "=== Removing modem configuration files ==="
sudo rm "$PPP_PEERS_DIR/ais"
sudo rm "$PPP_CHAT_DIR/ais_chat"

echo "=== Removing modem connection from rc.local ==="
sudo sed -i "/pon ais/d" "$RC_LOCAL_FILE"

echo "=== Stopping any active modem connection ==="
sudo poff ais 2>/dev/null || true

echo "=== Modem removal complete ==="
