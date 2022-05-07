#!/bin/bash -e

echo "Updating Repositores..."
sudo apt-get update -y > /dev/null

echo "Installing Blender..."
sudo apt-get install -y blender

# Fix blender dependencies
sudo apt-get --fix-broken install -y