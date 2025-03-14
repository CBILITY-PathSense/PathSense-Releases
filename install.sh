#!/bin/bash
set -e

# Install necessary shared libraries
echo "=== Installing required packages ==="
sudo apt-get update >/dev/null
sudo apt-get install -y --no-install-recommends \
  git libssl-dev wget tar

# Define variables
INSTALL_DIR="/usr/bin/pathsense"
SERVICE_FILE="/etc/systemd/system/pathsense_daemon.service"
RELEASE_DIR="$(dirname "$0")/pathsense-release"
RELEASE_DOWNLOAD_URL="https://github.com/CMKL-PathSense/PathSense-System-Releases/releases/download/0.1.5/pathsense-release.tar.gz"

# Create installation directory
echo "=== Preparing installation directories ==="
sudo rm -rf "$INSTALL_DIR" "$SERVICE_FILE" "$RELEASE_DIR"
sudo mkdir -p "$INSTALL_DIR"

# Download the latest release tarball
echo "=== Downloading PathSense release ==="
wget --no-verbose -O "$(dirname "$0")/pathsense-release.tar.gz" "$RELEASE_DOWNLOAD_URL"

# Untar the tarball
echo "=== Extracting release files ==="
mkdir -p "$RELEASE_DIR"
tar -xvf pathsense-release.tar.gz -C "$RELEASE_DIR" >/dev/null
rm pathsense-release.tar.gz

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

# Cleanup release directory
sudo rm -rf "$RELEASE_DIR"

# Create a new user with necessary permissions
echo "=== Initializing pathsense user ==="
id pathsense &>/dev/null || sudo useradd -r -M -G audio,video,netdev,bluetooth,dip -s /usr/sbin/nologin pathsense
sudo echo 'KERNEL=="video*", GROUP="video", MODE="0660"' >/etc/udev/rules.d/99-camera.rules
sudo echo 'KERNEL=="snd*", GROUP="audio", MODE="0660"' >/etc/udev/rules.d/99-audio.rules

# Reload systemd, enable and start service
echo "=== Starting systemd service ==="
sudo systemctl daemon-reload
sudo systemctl enable pathsense_daemon.service
sudo systemctl start pathsense_daemon.service

# Verify service status
echo "=== Checking systemd service status ==="
sudo systemctl status pathsense_daemon.service

echo "=== PathSense installation complete ==="
