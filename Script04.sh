#!/bin/sh

# Version 0.1
# Date: October 4th 2023

startingDirectory=/home/<user>/UninvitedActivity

cd $startingDirectory
sshpass -p <password> rsync -e "ssh -p 222" <user>@<firewall IP>:/home/<user>/FWLogBlock/* ./

# wait 10 seconds then run Script05

sleep 10
echo Starting Script05 at `date`
$startingDirectory/Script05.sh
