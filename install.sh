#!/bin/bash -e

# Get the current directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create a log file
today="$(date "+%Y.%m.%d.%mm.%s")"
log=$dir/install.$today.log

# Redirect all output to the log file
exec > >(tee -a ${log} )
exec 2> >(tee -a ${log} >&2)

appScripts=("$dir"/apps/*.sh)

# Ask for the user password & cache it
sudo true

echo "
=======================================================
Apps Available to Install...
======================================================="
for (( i=0; i<${#appScripts[@]}; i++ ));
do
  # Full path to the app script
  appScript=${appScripts[$i]}

  # Just the base name of the app script
  appScriptBaseName=$(basename -- "$appScript")

  echo "${appScriptBaseName%%.*}"
done

read -p "Install All Available Apps (Y/n): " installAllApps

for (( i=0; i<${#appScripts[@]}; i++ ));
do
  installApp='y'
  appScript=${appScripts[$i]}
  appScriptBaseName=$(basename -- "$appScript")
  appName="${appScriptBaseName%%.*}"

  # Check if the individual app should be installed
  # only if the user said no to all apps
  if [[ $installAllApps =~ N|n ]]; then
    printf '\n'
    read -p "Install $appName (Y/n): " installApp
  fi

  if [[ $installApp =~ Y|y || $installApp == '' ]]; then
    echo "
=======================================================
Executing $appScript...
======================================================="
    . "$appScript"
  fi
done