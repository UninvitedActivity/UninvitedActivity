#!/bin/sh

# Version 0.1
# Date: October 4th 2023

startingDirectory=/home/<user>/UninvitedActivity

cd $startingDirectory

mariadb -u <user> --password=<password> -h <Database host IP address> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity;" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Export.txt

# Wait 10 seconds then start Script07
sleep 10
echo Starting Script07 at `date`
$startingDirectory/Script07.sh
