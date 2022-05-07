#!/bin/bash -e

downloadUrl='https://www.xmind.net/xmind/downloads/xmind-8-update9-linux.zip'
repositoryUrl='https://github.com/mriza/XMind-Linux-Installer.git'
cloneDir='/tmp/XMind-Linux-Installer'

echo "Installing Dependencies..."
sudo apt-get install -y \
    unzip \
    default-jre \
    libgtk2.0-0 \
    lame \
    libc6 \
    libglib2.0-0

git clone $repositoryUrl $cloneDir

if [ -d $cloneDir ]; then
    sudo chmod +x $cloneDir/*.sh

    wget -O $cloneDir/xmind-8-update9-linux.zip $downloadUrl

    echo "Installing Xmind..."
    pushd $cloneDir
    sudo bash $cloneDir/xmind-installer.sh $(whoami)
    popd
fi