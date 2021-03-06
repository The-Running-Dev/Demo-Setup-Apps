#!/bin/bash -e

# install dependencies
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

# get all Microsoft repositories
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# install updates again and install VS Code
sudo apt-get install -y apt-transport-https

echo "Updating Repositores..."
sudo apt-get update -y > /dev/null

echo "Installing Visual Studio Code..."
sudo apt-get install -y code

# Cleanup
rm ./packages.microsoft.gpg