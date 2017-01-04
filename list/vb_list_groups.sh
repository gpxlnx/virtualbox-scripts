#!/bin/bash
#
# This Bash script is used to list all Virtualbox groups from the command line
# Example: ./vb_list_groups.sh

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "${bold}Listing Virtualbox groups${normal}"
VBoxManage list groups

