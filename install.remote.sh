#!/bin/bash -e

repositoryUrl='https://github.com/The-Running-Dev/Demo-Setup-Apps.git'
cloneDir='/tmp/Setup-Apps/'

git clone $repositoryUrl $cloneDir

if [ -d $cloneDir ]; then
    sudo chmod +x $cloneDir/*.sh

    $cloneDir/install.sh
fi