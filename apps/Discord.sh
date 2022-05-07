#!/bin/bash -e

wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

echo "Installing Discord..."
sudo apt-get install -y /tmp/discord.deb

# Cleanup
rm /tmp/discord.deb