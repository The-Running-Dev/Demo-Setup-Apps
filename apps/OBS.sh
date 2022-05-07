#!/bin/bash -e

sudo add-apt-repository -y ppa:obsproject/obs-studio

echo "Installing OBS..."
sudo apt-get install -y obs-studio