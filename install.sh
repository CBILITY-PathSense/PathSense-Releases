#!/bin/bash
set -e

# Define variables
RELEASE_DIR="$(dirname "$0")/pathsense-release"

# Run the download script
bash download.sh

# Run the install script
cd "$RELEASE_DIR"
bash install.sh
