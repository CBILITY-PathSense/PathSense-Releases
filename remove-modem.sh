#!/bin/bash
set -e

# Define variables
PPP_PEERS_DIR="/etc/ppp/peers"
PPP_CHAT_DIR="/etc/chatscripts"
RC_LOCAL_FILE="/etc/rc.local"

# Remove modem configuration files
echo "=== Removing modem configuration files ==="
if [ -f "$PPP_PEERS_DIR/ais" ]; then
  sudo rm "$PPP_PEERS_DIR/ais"
  echo "Removed $PPP_PEERS_DIR/ais"
fi

if [ -f "$PPP_CHAT_DIR/ais_chat" ]; then
  sudo rm "$PPP_CHAT_DIR/ais_chat"
  echo "Removed $PPP_CHAT_DIR/ais_chat"
fi

# Remove 'pon ais' from rc.local
echo "=== Removing modem autostart from rc.local ==="
if [ -f "$RC_LOCAL_FILE" ]; then
  sudo sed -i "/pon ais/d" "$RC_LOCAL_FILE"
  echo "Removed 'pon ais' from $RC_LOCAL_FILE"
fi

echo "=== Stopping any active modem connection ==="
sudo poff ais 2>/dev/null || true

echo "=== Modem removal complete ==="
