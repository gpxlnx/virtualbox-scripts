#!/bin/bash
#
# This Bash script is used to start a group of Virtualbox VMs from command line. Make sure to tag the VM with a group
# Example: ./start_vb_group.sh puppet
#

bold=$(tput bold)
normal=$(tput sgr0)


# Find out which Virtualbox group a VM belongs to
function search_vm_group() {

   GROUP=$(vboxmanage showvminfo $1 |grep Groups: |awk {'print tolower($2)'} |sed 's/\///g')

   if [[ $GROUP == "$2" ]]; then

      echo -e "${bold}Booting VM: $1${normal}"
      vboxmanage startvm $1 --type headless

   fi

}

# List all available virtualbox VMs
for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g'); do

  search_vm_group $vm $1

done
