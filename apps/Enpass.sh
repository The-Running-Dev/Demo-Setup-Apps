#!/bin/bash -e

sudo sh -c 'echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list'
sudo sh -c 'wget -O - https://apt.enpass.io/keys/enpass-linux.key | tee /etc/apt/trusted.gpg.d/enpass.asc'

sudo apt-get update -y

echo "Installing Enpass..."
sudo apt-get install -y enpass