#!/bin/bash
#
# This Bash script is used to start all Virtualbox VMs from command line
# Example: ./vb_start_all.sh

bold=$(tput bold)
normal=$(tput sgr0)

for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g'); do

  echo -e "\n${bold}Booting $vm${normal}"
  vboxmanage startvm $vm --type headless

done

