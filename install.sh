#!/bin/bash

INSTALL_DIR="$HOME/bin"

echo "Creating home bin directory..."
mkdir -p "$INSTALL_DIR"

cp -v capture-card/launch_capture_card.sh "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/launch_capture_card.sh"

cp -v capture-card/set_capture_card_defaults.sh "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/set_capture_card_defaults.sh"
sudo cp -v capture-card/99-capture-card.rules /etc/udev/rules.d/

cp -v screenshot/rescale.sh "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/rescale.sh"

cp -v screenshot/post_screenshot_monitor.sh "$INSTALL_DIR"
chmod +x "$INSTALL_DIR/post_screenshot_monitor.sh"

echo "Scripts were installed successfully, make sure to add 'export PATH=\$PATH:\$HOME/bin' to your .bashrc file"

echo "For incrontab tools, make sure to add the right incrontab entries as described in the tool's own README.md instructions."
