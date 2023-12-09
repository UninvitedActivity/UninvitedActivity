#!/bin/sh

# Version 0.3
# Date: October 19th 2023

# Variable setup and Confirmation
date=`date "+%Y%m%d"`
startingDirectory=/home/<user>/UninvitedActivity
echo Date: $date

cd $startingDirectory

awk -F"[,]" '{print "INSERT INTO `uninvitedActivity` (`activityDate`, `ipAddress`, `server`, `scanType`) VALUES ('\''"$1"'\'', '\''"$2"'\'', '\''"$3"'\'', '\''"$4"'\'');"}' ${date}_DBImportReady.csv > ImportSQLCommands.sql

awk -F"[,]" '{print "UPDATE `uninvitedActivity` SET `activityDate` = '\''"$1"'\'' WHERE `ipAddress` = '\''"$2"'\'';"}' ${date}_DBImportReady.csv > UpdateSQLCommands.sql

awk -F"[,]" '{print "UPDATE `uninvitedActivity` SET `counter` = `counter` + 1 WHERE `ipAddress` = '\''"$2"'\'';"}' ${date}_DBImportReady.csv > AddCounterSQLCommands.sql

while IFS= read -r line;
do
   mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "$line";
done < UpdateSQLCommands.sql

sleep 5

while IFS= read -r line;
do
   mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "$line";
done < AddCounterSQLCommands.sql

sleep 5

while IFS= read -r line;
do
   mariadb -u <user> --password=<password> -h <Database IP> UninvitedActivity -e "$line";
done < ImportSQLCommands.sql

# wait 10 seconds, then run Script06
sleep 10
echo Starting Script06 at `date`
$startingDirectory/Script06.sh
