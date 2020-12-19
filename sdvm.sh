#!/bin/bash

echo "Once VM is shutdown, would you like to..."
echo "1. Shutdown"
echo "2. Reboot"
# echo "3. Boot Windows"
# echo "4. Boot macOS"
# echo "5. Boot Ubuntu"
read -s -n 1 prompt
printf "\n"

tmp=$(virsh list --all | grep "running" | awk '{ print $3}')
if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
then
	vm="off"
else
	vm="on"
fi

if [ "$vm" = "off" ]
then
	echo "No VMs are running. Exiting."
	exit
fi

if vm="on"
then	
	echo "At least one VM is running, entering loop."
fi

while vm="on"
do
	tmp=$(virsh list --all | grep "running" | awk '{ print $3}')
	if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
	then
	    vm="off"
		echo "The VM has shutdown! Waiting five seconds before continuing..."
		sleep 5
		break
	else
	    vm="on"
	fi
done

# resetbugcheck=$("sudo virsh start Ubuntu | grep '127' | awk '{ print $3}'" > /dev/null 2>&1)
# if ([ "x$resetbugcheck" == "x" ] || [ "x$resetbugcheck" != "xrunning" ])
# then
# 	echo "Reset bug detected :("
# 	echo "Rebooting host now."
# 	sudo reboot now
# 	exit
# else
# 	resetbug=False
# 	exit
# fi

if [ "$prompt" = "1" ] && [ "$vm" = "off" ]
then
	echo "Shutting down host now."
    sudo shutdown now
    exit
fi

if [ "$prompt" = "2" ] && [ "$vm" = "off" ]
then
    echo "Rebooting host now."
	sudo reboot now
	exit
fi

# if [ "$prompt" = "3" ] && [ "$vm" = "off" ]
# then
# 	echo "Booting Windows now."
# 	sudo virsh start Windows
# 	exit
# fi

# if [ "$prompt" = "4" ] && [ "$vm" = "off" ]
# then
# 	echo "Booting macOS now."
# 	sudo virsh start macOS
# 	exit
# fi

# if [ "$prompt" = "5" ] && [ "$vm" = "off" ]
# then
# 	echo "Booting Ubuntu now."
# 	sudo virsh start Ubuntu
# 	exit
# fi
