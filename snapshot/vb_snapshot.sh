#!/bin/bash
#
# This Bash script is used to take a snapshot of a VM in Virtualbox from command line
# Example: ./snapshot.sh
#

if [ $# -ne 1 ]; then
    echo "Usage: $0" servername
    exit 1
fi


VBoxManage snapshot "$1" take "Snapshot taken by $(whoami)@$(hostname) $(date +'%Y-%m-%d %H:%M:%S')"
