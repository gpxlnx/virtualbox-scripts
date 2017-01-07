#!/bin/bash
#
# This Bash script is used to stop a group of Virtualbox VMs from command line. Make sure to tag the VM with a group
# Example: ./vb_group_stop.sh puppet
#

bold=$(tput bold)
normal=$(tput sgr0)

# Find out which Virtualbox group a VM belongs to
function search_vm_group() {

   GROUP=$(vboxmanage showvminfo $1 |grep Groups: |awk {'print tolower($2)'} |sed 's/\///g')

   if [[ $GROUP == "$2" ]]; then

      echo "${bold}Shutting down VM: $1 Group: $2${normal}"
      vboxmanage controlvm $1 poweroff

   fi

}

# List all available virtualbox VMs
for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g'); do

  search_vm_group $vm $1

done
