#!/bin/bash
#
# Show Virtualbox settings for VM
# Example: ./vb_vm_settings.sh server01

if [ $# -ne 1 ]; then
    echo "Usage: $0" servername
    exit 1
fi

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${bold}Showing Virtualbox settings for VM: $1${normal}"
VBoxManage showvminfo $1 --machinereadable
