Virtualbox-scripts
========
*This repo contains Bash scripts for managing Virtualbox from the command line*

Installation
============
*Clone or download the content of this repo to your computer*

**[jf@Tzunami ~]$** cd ~    
**[jf@Tzunami ~]$** git clone https://github.com/jensfredlund/virtualbox-scripts.git  
Cloning into 'virtualbox-scripts'...  
remote: Counting objects: 29, done.  
remote: Compressing objects: 100% (22/22), done.  
remote: Total 29 (delta 4), reused 29 (delta 4), pack-reused 0  
Unpacking objects: 100% (29/29), done.  
  
**[jf@Tzunami ~]$** ls virtualbox-scripts/  
bashrc.txt  network  README.md  snapshot   storage  
list        ports    settings   startstop  vb_help.sh  

Bash aliases
============  
*Add the Bash aliases below to your to ~/.bashrc file. Don't forget to change the VB_SCRIPTPATH to the directory where the virtualbox-scripts is located.*

```  
VB_SCRIPTPATH="~/virtualbox-scripts"  
  
function vb_stop() {  
    echo "Waiting for VM \"$1\" to shutdown..."
    vboxmanage controlvm $1 poweroff  
}  
  
function vb_start() {  
    vboxmanage startvm $1 --type headless  
}  
  
alias vbhelp="$VB_SCRIPTPATH/vb_help.sh"  
alias vblist="$VB_SCRIPTPATH/list/vb_list_all_vms.sh"  
alias vbstart=vb_start  
alias vbstartg="$VB_SCRIPTPATH/startstop/vb_group_start.sh "$1""  
alias vbrunning="$VB_SCRIPTPATH/list/vb_list_running_vms.sh"  
alias vbstop=vb_stop  
alias vbstopg="$VB_SCRIPTPATH/startstop/vb_group_stop.sh "$1""  
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
alias vbstopall="$VB_SCRIPTPATH/startstop/vb_poweroff_all.sh"
alias vbstartall="$VB_SCRIPTPATH/startstop/vb_start_all.sh"
``` 
List available aliases in the console
============
*This example will list all available Virtualbox Bash aliases from the command line*

```
jf@Tzunami:~/$ vbhelp
Use the Bash aliases below to manage Virtualbox from the command line:

Start/stop VM:
vbstart server01 - Start VM server01
vbstop server01  - Stop VM server01

Group action:
vbstartg puppet  - Start all VMs in group puppet
vbstopg puppet   - Stop all server in grou puppet

Network:
vbports          - List port forwarding for all Virtualbox VMs
vbmac server01   - List MAC for VM
vbip             - List IP for all VMs

Snapshot:
vbsnaps sever01                        - List snapshots for server01
vbsnap server01                        - Take snapshot of server01
vbrestoresnap server01 snapshotUUID    - Restore snapshot on server01 with snapshotUUID
vbremovesnap server01 snapshotUUID     - Remove snapshot from server01 with snapshotUUID

Misc:
vbhelp           - Show this output
vblist           - List all Virutalbox VMs active & disabled
vbrunning        - List all running VMs
```

List running VMs
============
*This example will list all running Virtualbox VMs from the command line*

```
jf@Tzunami:~$ vbrunning
These VMs is currently running in Virtualbox:
nginx1
nginx2
nginx3
mysql1
```

Shutdown Virtualbox VM
============
*This example will shutdown a Virtualbox VM from the command line*

```
jf@Tzunami:~$ vbstop nginx3
Waiting for VM "nginx3" to shutdown...
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

```

Start Virtualbox VM
============
*This example will start a Virtualbox VM from the command line*

```
jf@Tzunami:~$ vbstart nginx3
Waiting for VM "nginx3" to power on...
VM "nginx3" has been successfully started.
```

Take snapshot of Virtualbox VM
============
*This example will take a snapshot of a Virtualbox VM from the command line*

```
jf@Tzunami:~/$ vbsnap nginx1
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Snapshot taken. UUID: 947ad21d-2cad-4e64-80cc-2ff819d1be4e
```

List snapshots of Virtualbox VM
============
*This example will list all available snapshots for a Virtualbox VM from the command line*
```
jf@Tzunami:~/$ vbsnaps nginx1
SnapshotName="Snapshot taken by jf@Tzunami 2017-01-07 20:51:48"
SnapshotUUID="947ad21d-2cad-4e64-80cc-2ff819d1be4e"
CurrentSnapshotName="Snapshot taken by jf@Tzunami 2017-01-07 20:51:48"
CurrentSnapshotUUID="947ad21d-2cad-4e64-80cc-2ff819d1be4e"
CurrentSnapshotNode="SnapshotName"
```

Restore snapshots of Virtualbox VM
============
*This example will restore a snapshot for a Virtualbox VM from the command line*

```
jf@Tzunami:~/$ vbrestoresnap nginx1 947ad21d-2cad-4e64-80cc-2ff819d1be4e
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
```

List portforwarding rules for VMs in Virtualbox
============
*This example will list all port forwarding rules for all Virtualbox VMs from the command line*

```
jf@Tzunami:~/$ vbports
VM: mysql1 Port Forward: 2202 => 22
VM: nginx1 Port Forward: 2222 => 22
VM: nginx2 Port Forward: 2200 => 22
VM: nginx3 Port Forward: 2201 => 22
```

List MAC addresses for Virtualbox VM
============
*This example will list all MAC-addresses for a specific Virtualbox VM from the command line*

```
jf@Tzunami:~/$ vbmac nginx1
NIC1:MAC:025194FB32E8,NAT,
NIC2:MAC:0800273D9CE8,Host-only
```

List IP addresses for Virtualbox VMs
============
*This example will list the IP addresses for all Virtualbox VMs from the command line*
```
jf@Tzunami:~/$ vbip
nginx1
192.168.56.11
nginx2
192.168.56.12
nginx3
192.168.56.13
mysql1
192.168.56.21
```

List Virtualbox VM groups
============
*This example will list all available Virtual machine groups in Virtualbox from the command line*
```
jf@Tzunami:~/$ vbgroups
Listing Virtualbox groups
"/MySQL servers"
"/Nginx servers"
```

Start a group of Virtualbox VMs
============
*This example will start a group of Virtualbox VMs from the command line*
```
jf@Tzunami:~/$ vbstartg nginx servers
Booting VM: nginx1
Waiting for VM "nginx1" to power on...
VM "nginx1" has been successfully started.
Booting VM: nginx2
Waiting for VM "nginx2" to power on...
VM "nginx2" has been successfully started.
Booting VM: nginx3
Waiting for VM "nginx3" to power on...
VM "nginx3" has been successfully started.
```

Shutdown a group of Virtualbox VMs
============
*This example will stop a group of Virtualbox VMs from the command line*
```
jf@Tzunami:~/$ vbstopg nginx servers
Shutting down VM: nginx1 Group: nginx
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Shutting down VM: nginx2 Group: nginx
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Shutting down VM: nginx3 Group: nginx
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
```

Start all Virtualbox VMs
============
*This example will start all installed Virtualbox VMs from the command line*
```
jf@Tzunami:~/$ vbstartall

Booting nginx1
Waiting for VM "nginx1" to power on...
VM "nginx1" has been successfully started.

Booting nginx2
Waiting for VM "nginx2" to power on...
VM "nginx2" has been successfully started.

Booting nginx3
Waiting for VM "nginx3" to power on...
VM "nginx3" has been successfully started.

Booting mysql1
Waiting for VM "mysql1" to power on...
VM "mysql1" has been successfully started.
```

Stop all Virtualbox VMs
============
*This example will stop all installed Virtualbox VMs from the command line*
```
jf@Tzunami:~/$ vbstopall

Poweroff nginx1
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

Poweroff nginx2
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

Poweroff nginx3
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

Poweroff mysql1
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
```
