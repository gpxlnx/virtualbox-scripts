#!/bin/bash
#
# This Bash script is used to list the IP of all the running Virtualbox VMs from the command line
# Example: ./vb_list_ip.sh
#
# NOTE: The VM have to been started to see the IP

bold=$(tput bold)
normal=$(tput sgr0)

for vm in $(VBoxManage list vms |awk {'print $1'} |sed 's/\"//g'); do

   echo "${bold}$vm${normal}"
   VBoxManage --nologo guestproperty get "$vm" /VirtualBox/GuestInfo/Net/1/V4/IP |awk {'print $2'}

done
