#!/bin/bash -e

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

echo "Installing Node JS..."
sudo apt-get install -y nodejs