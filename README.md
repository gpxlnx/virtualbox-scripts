Virtualbox-scripts
========
This repo contains Bash scripts for managing Virtualbox from the command line

Installation
============
Clone or download the content of this repo to your computer 

### Example:
[username@laptop ~] cd ~    
[username@laptop ~]$ git clone https://github.com/jensfredlund/virtualbox-scripts.git  
Cloning into 'virtualbox-scripts'...  
remote: Counting objects: 29, done.  
remote: Compressing objects: 100% (22/22), done.  
remote: Total 29 (delta 4), reused 29 (delta 4), pack-reused 0  
Unpacking objects: 100% (29/29), done.  
  
[username@laptop ~]$ ls virtualbox-scripts/  
bashrc.txt  network  README.md  snapshot   storage  
list        ports    settings   startstop  vb_help.sh  
  
### Add the Bash aliases below to your to ~/.bashrc file. Don't forget to change the VB_SCRIPTPATH to the directory where the virtualbox-scripts is located. 
  
VB_SCRIPTPATH="~/virtualbox-scripts"  
  
function vb_stop() {  
   vboxmanage controlvm $1 poweroff  
}  
  
function vb_start() {  
   vboxmanage startvm $1 --type headless  
}  
  
alias vbhelp="$VB_SCRIPTPATH/vb_help.sh"  
alias vblist="$VB_SCRIPTPATH/list/vb_list_all_vms.sh"  
alias vbstart=vb_start  
alias vbstartg="$VB_SCRIPTPATH/startstop/vb_group_start.sh $1"  
alias vbrunning="$VB_SCRIPTPATH/list/vb_list_running_vms.sh"  
alias vbstop=vb_stop  
alias vbstopg="$VB_SCRIPTPATH/startstop/vb_group_stop.sh $1"  
alias vbports="$VB_SCRIPTPATH/ports/vb_list_port_forward_all.sh"  
alias vbgroups="$VB_SCRIPTPATH/list/vb_list_groups.sh"  
alias vbmac="$VB_SCRIPTPATH/network/vb_list_mac.sh $1"  
alias vbip="$VB_SCRIPTPATH/network/vb_list_ip.sh $1"  
alias vbsnaps="$VB_SCRIPTPATH/snapshot/vb_list_snapshot.sh $1"  
alias vbsnap="$VB_SCRIPTPATH/snapshot/vb_snapshot.sh $1"  
alias vbremovesnap="$VB_SCRIPTPATH/snapshot/vb_remove_snapshot.sh $1"  
alias vbrestoresnap="$VB_SCRIPTPATH/snapshot/vb_remove_snapshot.sh $1 $2"  
alias vbsettings="$VB_SCRIPTPATH/settings/vb_vm_settings.sh $1"  
alias vbstorage="$VB_SCRIPTPATH/storage/vb_list_all_disks.sh"  
