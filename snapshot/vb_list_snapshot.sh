#!/bin/bash
#
# This Bash script is used to list all snapshots for a Virtualbox VM from command line
# Example: ./list_snapshot.sh server01

if [ $# -ne 1 ]; then
    echo "Usage: $0" servername
    exit 1
fi

VBoxManage snapshot $1 list --machinereadable
