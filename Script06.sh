#!/bin/sh

# Version 0.2
# Date: November 20th 2023

startingDirectory=/home/<user>/UninvitedActivity

cd $startingDirectory

# The full list of IP addresses in the Database
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity;" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Export.txt

# Rule 1: Mail port scans
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity WHERE scanType = 'mail';" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Rule1.txt

# Rule 2: Low Port scans only
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity WHERE scanType = 'lowPorts';" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Rule2.txt

# Rule 4: High Port scans from Low Ports
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity WHERE scanType = 'loHiPorts';" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Rule4.txt

# Rule 3: High Port scans from High ports
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity WHERE scanType = 'highPorts';" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Rule3.txt

# Rule 5: Any other uninvited activity using IPv4
mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "SELECT ipAddress from uninvitedActivity WHERE scanType = 'anyIPv4';" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Rule5.txt

# Wait 10 seconds then start Script07
sleep 10
echo Starting Script07 at `date`
$startingDirectory/Script07.sh

# ==========
# Change Log
# ==========
# V 0.2
# -----
# Added lines to output different Rules to different export files
#
