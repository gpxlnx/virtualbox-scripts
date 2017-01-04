#!/bin/bash
#
# List Port forwards for all VMs in Virtualbox from the command line
# Example: ./vb_list_port_forward_all.sh

bold=$(tput bold)
normal=$(tput sgr0)

function list_port_forward_rule() {

   PORTS=$(VBoxManage showvminfo $1 --machinereadable | awk -F '[",]' '/^Forwarding/ { printf ("%d => %d\n", $5, $7); }')

   echo -e "${bold}VM:${normal} $1 ${bold}Port Forward:${normal} $PORTS"

}

for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g' |sort); do

   list_port_forward_rule $vm

done

