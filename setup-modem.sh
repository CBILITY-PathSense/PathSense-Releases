#!/bin/bash
set -e

# Define variables
PPP_PEERS_DIR="/etc/ppp/peers"
PPP_CHAT_DIR="/etc/chatscripts"
RELEASE_DIR="$(dirname "$0")/pathsense-release"
RC_LOCAL_FILE="/etc/rc.local"

# Copy modem configuration files
echo "=== Copying modem configuration files ==="
sudo cp "$RELEASE_DIR/modem/ais" "$PPP_PEERS_DIR/ais"
sudo cp "$RELEASE_DIR/modem/ais_chat" "$PPP_CHAT_DIR/ais_chat"

# Configure rc.local to start modem connection at boot
echo "=== Configuring rc.local for modem connection ==="
if [ ! -f "$RC_LOCAL_FILE" ]; then
  echo "#!/bin/bash" | sudo tee "$RC_LOCAL_FILE" >/dev/null
  echo "exit 0" | sudo tee -a "$RC_LOCAL_FILE" >/dev/null
  sudo chmod +x "$RC_LOCAL_FILE"
fi
sudo sed -i "/^exit 0/i pon ais" "$RC_LOCAL_FILE"

# Start modem connection
echo "=== Starting modem connection ==="
sudo pon ais

echo "=== Modem setup complete ==="
