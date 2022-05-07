#!/bin/bash -e

# Install dependencies
sudo apt-get install -y gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

echo "Updating Repositores..."
sudo apt-get update -y > /dev/null

echo "Installing Mongo DB Server..."
sudo apt-get install -y mongodb-org

# Get MangoDB Compass
wget -O /tmp/mongodb-compass_1.31.1_amd64.deb https://downloads.mongodb.com/compass/mongodb-compass_1.31.1_amd64.deb

echo "Installing Mongo DB Compass..."
sudo dpkg -i /tmp/mongodb-compass_1.31.1_amd64.deb

# Cleanup
rm /tmp/mongodb-compass_1.31.1_amd64.deb