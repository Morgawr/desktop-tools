#!/bin/bash

INSTALL_DIR="$HOME/bin"

echo "Creating home bin directory..."
mkdir -p "$INSTALL_DIR"

cp -v capture-card/launch_capture_card.sh "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/launch_capture_card.sh"

echo "Scripts were installed successfully, make sure to add 'export PATH=\$PATH:\$HOME/bin' to your .bashrc file"
