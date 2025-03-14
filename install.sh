#!/bin/bash
set -e

# Define variables
INSTALL_DIR="/usr/local/bin/pathsense"
SERVICE_FILE="/etc/systemd/system/pathsense_daemon.service"
RELEASE_DIR="$(dirname "$0")/pathsense-release"

# Create installation directory
echo "=== Preparing installation directories ==="
sudo rm -rf "$INSTALL_DIR" "$SERVICE_FILE"
sudo mkdir -p "$INSTALL_DIR"

# Install runtime dependencies
echo "=== Installing runtime dependencies ==="
chmod +x "$RELEASE_DIR/install-runtime-dependencies.sh"
$RELEASE_DIR/install-runtime-dependencies.sh >/dev/null

# Copy files to the installation directory
echo "=== Copying PathSense files to installation directory ==="
sudo cp -r "$RELEASE_DIR/system/bin/pathsense_system" "$INSTALL_DIR/pathsense_system"
sudo cp -r "$RELEASE_DIR/system/bin/dependencies" "$INSTALL_DIR/dependencies"
sudo cp -r "$RELEASE_DIR/system/bin/proto" "$INSTALL_DIR/proto"
sudo chmod +x "$INSTALL_DIR/pathsense_system"

# Install systemd service
echo "=== Installing systemd service ==="
sudo cp "$RELEASE_DIR/pathsense_daemon.service" "$SERVICE_FILE"
sudo chmod 644 "$SERVICE_FILE"

# Create a new user with necessary permissions
echo "=== Creating pathsense user and group ==="
sudo groupadd pathsensegroup
sudo useradd -r -M -G audio,video,netdev,bluetooth,dip,pathsensegroup -s /usr/sbin/nologin pathsense
sudo chown -R root:pathsensegroup "$INSTALL_DIR"
sudo chmod -R g+rwx "$INSTALL_DIR"
sudo chmod g+s "$INSTALL_DIR"

# Reload systemd, enable and start service
echo "=== Starting systemd service ==="
sudo systemctl daemon-reload
sudo systemctl enable pathsense_daemon.service
sudo systemctl start pathsense_daemon.service

# Verify service status
echo "=== Checking systemd service status ==="
sudo systemctl status pathsense_daemon.service

echo "=== PathSense installation complete ==="
