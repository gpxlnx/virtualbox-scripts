#!/bin/bash
#
# This Bash script is used to list all Port forwarding rules for a specific VM in Virtualbox from the command line
# Example: ./vb_list_prot_forward.sh

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${bold}Port forward rules for VM: $1${normal}"

VBoxManage showvminfo $1 --machinereadable | awk -F '[",]' '/^Forwarding/ { printf ("Rule %s host port %d forwards to guest port %d\n", $2, $5, $7); }'
