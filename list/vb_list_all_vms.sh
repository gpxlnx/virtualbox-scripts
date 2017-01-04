#!/bin/bash
#
# This bash script is used to list all running Virtualbox VMs from command line
# Example: ./vb_list_all_vms.sh
#

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${bold}Listing all VMs in Virtualbox Poweredoff and Active:\n${normal}"

for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g'); do

   echo $vm

done
