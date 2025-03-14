#!/bin/bash
set -e

# Define variables
RELEASE_DIR="$(dirname "$0")/pathsense-release"
RELEASE_DOWNLOAD_URL="https://github.com/CMKL-PathSense/PathSense-System-Releases/releases/download/0.2.0/pathsense-release.tar.gz"

# Clean old releases
sudo rm -rf "$RELEASE_DIR"
sudo rm -f "$(dirname "$0")/pathsense-release.tar.gz"

# Install necessary shared libraries
echo "=== Installing required packages ==="
sudo apt-get update >/dev/null
sudo apt-get install -y --no-install-recommends \
  git libssl-dev wget tar

# Download the latest release tarball
echo "=== Downloading PathSense release ==="
wget --no-verbose -O "$(dirname "$0")/pathsense-release.tar.gz" "$RELEASE_DOWNLOAD_URL"

# Untar the tarball
echo "=== Extracting release files ==="
mkdir -p "$RELEASE_DIR"
tar -xvf pathsense-release.tar.gz -C "$RELEASE_DIR" >/dev/null
rm pathsense-release.tar.gz
