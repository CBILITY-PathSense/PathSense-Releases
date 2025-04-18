#!/bin/bash
set -e

# Define variables
RELEASE_DIR="$(dirname "$0")/pathsense-release"

# Run the installation script
cd "$RELEASE_DIR"
bash remove.sh
