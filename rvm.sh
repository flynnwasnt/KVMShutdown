
#!/bin/bash

echo "Script Started"

vm=""
waitingforshutdown=false
activevm=""
macOS=""
Windows=""

tmp=$(virsh list --all | grep "macOS" | awk '{ print $3}')
if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
then
   macOS=off
else
    vm="on"
    activevm="macOS"
fi


tmp=$(virsh list --all | grep "Windows" | awk '{ print $3}')
if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
then
   Windows="off"
else
    vm="on"
    activevm="Windows"
fi


if [ "$macOS" = "off" ] && [ "$Windows" = "off" ]
then
	echo "No VMs are running. Exiting."
	exit
fi



if vm="on"
then	
	echo "$activevm is running, entering loop."
fi

while vm="on"
do
	tmp=$(virsh list --all | grep "$activevm" | awk '{ print $3}')
	if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
	then
	    vm="off"
	    echo "$activevm has shutdown! Restarting host in 5 seconds."
	    sleep 5
	    sudo reboot now
	    exit
	else
	    vm="on"
	fi
done

