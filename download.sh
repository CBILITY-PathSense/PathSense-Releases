#!/bin/bash
set -e

# Define variables
RELEASE_DIR="$(dirname "$0")/pathsense-release"
RELEASE_VERSION="0.2.1"
RELEASE_FILE_NAME="pathsense-release.tar.gz"
RELEASE_DOWNLOAD_URL="https://github.com/CBILITY-PathSense/PathSense-Releases/releases/download/$RELEASE_VERSION/$RELEASE_FILE_NAME"

# Clean old releases
sudo rm -rf "$RELEASE_DIR"
sudo rm -f "$(dirname "$0")/pathsense-collector-release.tar.gz"

# Install necessary shared libraries
echo "=== Installing required packages ==="
sudo apt-get update >/dev/null
sudo apt-get install -y --no-install-recommends \
  git libssl-dev wget tar

# Download the latest release tarball
echo "=== Downloading release ==="
wget --no-verbose -O "$(dirname "$0")/$RELEASE_FILE_NAME" "$RELEASE_DOWNLOAD_URL"

# Untar the tarball
echo "=== Extracting release files ==="
mkdir -p "$RELEASE_DIR"
tar -xzf "$RELEASE_FILE_NAME" -C "$RELEASE_DIR" >/dev/null
rm "$RELEASE_FILE_NAME"
