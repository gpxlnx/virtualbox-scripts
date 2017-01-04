#!/bin/bash
#
# This Bash script is used to remove a snapshot from a VM from command line
# ./remove_snapshot.sh server01 snapshotUUID
#
# $1 == servername
# $2 == snapshot uuid

if [ $# -ne 2 ]; then
    echo "Usage: $0" servername snapshotUUID
    exit 1
fi


VBoxManage snapshot $1 delete $2
