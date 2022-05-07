#!/bin/bash -e

wget -O /tmp/figma-linux_0.9.6_linux_amd64.deb "https://github.com/Figma-Linux/figma-linux/releases/download/v0.9.6/figma-linux_0.9.6_linux_amd64.deb"

echo "Installing Figma..."
sudo apt-get install -y /tmp/figma-linux_0.9.6_linux_amd64.deb

# Cleanup
rm /tmp/figma-linux_0.9.6_linux_amd64.deb