#!/bin/bash
#
# Virtualbox helper script which list all available Bash aliases that can be used from command line to manage Virtualbox
#
# NOTE: Don't forget to add the Bash aliases from the bashrc.txt file to ~/.bashrc
#

bold=$(tput bold)
normal=$(tput sgr0)


echo -e "${bold}Use the Bash aliases below to manage Virtualbox from the command line:\n${normal}"

echo -e "${bold}Start/stop VM:${normal}
vbstart server01 - Start VM server01
vbstop server01  - Stop VM server01";

echo -e "\n${bold}Start/stop all VMs:${normal}
vbstartall       - Start all VMs
vbstopall        - Stop all VMs"

echo -e "\n${bold}Group action:${normal}
vbstartg puppet  - Start all VMs in group puppet
vbstopg puppet   - Stop all server in grou puppet"

echo -e "\n${bold}Network:${normal}
vbports          - List port forwarding for all Virtualbox VMs
vbmac server01   - List MAC for VM
vbip	         - List IP for all VMs";

echo -e "\n${bold}Snapshot:${normal}
vbsnaps sever01	 		       - List snapshots for server01
vbsnap server01	                       - Take snapshot of server01
vbrestoresnap server01 snapshotUUID    - Restore snapshot on server01 with snapshotUUID
vbremovesnap server01 snapshotUUID     - Remove snapshot from server01 with snapshotUUID"

echo -e "\n${bold}Misc:${normal}
vbhelp           - Show this output
vblist           - List all Virutalbox VMs active & disabled
vbrunning        - List all running VMs";
