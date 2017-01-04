#!/bin/bash
#
# This Bash script is used to list the MAC address for a VM in Virtualbox from the command line
# Example: ./vb_list_mac.sh server01

bold=$(tput bold)
normal=$(tput sgr0)

if [ $# -ne 1 ]; then
    echo "Usage: $0" servername
    exit 1
fi

VBoxManage showvminfo $1 |grep NIC |grep MAC |awk {'print $1 $2 $3 $4 $6'}
