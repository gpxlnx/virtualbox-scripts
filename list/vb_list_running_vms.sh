#!/bin/bash
#
# This Bash script is used to list all running Virtualbox VMs from the command line
# Example ./vb_list_running_vms.sh
#

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}These VMs is currently running in Virtualbox:${normal}"
VBoxManage list runningvms |awk {'print $1'} |sed 's/\"//g'
