#!/bin/bash
#
# This Bash script is used to shutdown all running virtualbox VMs from command line
# Example ./vb_poweroff_all.sh
#

bold=$(tput bold)
normal=$(tput sgr0)

for vm in $(VBoxManage list runningvms |awk {'print $1'} |sed 's/\"//g'); do

  echo -e "\n${bold}Poweroff $vm${normal}"
  vboxmanage controlvm $vm poweroff

done

