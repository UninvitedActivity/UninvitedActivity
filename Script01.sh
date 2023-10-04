#!/bin/sh

# Version 0.1
# Date: October 4th 2023

# Variable setup
date=`date "+%Y%m%d"`
dateTime=`date "+%Y%m%d_%H%M"`
# The -v parameter determines how far back to retrieve the time of the previous output, currently set to 60 minutes
dateTimePrev=`date -v-60M "+%Y%m%d_%H%M"`
logDirectory=/var/log/filter
workingDirectory=/home/<_user_>/FWLogBlock
scriptsDirectory=/root/scripts
outputPrefix=BlockListAdditions_

# Variable confirmation - comment this out when it's all working
echo "Variable confirmations:"
echo "-----------------------" 
echo Date: $date
echo Date_time: $dateTime
echo Previous date_time: $dateTimePrev
echo Log directory: $logDirectory
echo Working directory: $workingDirectory
echo Scripts directory: $scriptsDirectory
echo "========================"
echo
echo "Creating working directory if it doesn't already exist"
echo "------------------------------------------------------"

if [ ! -d "$workingDirectory" ]
then
   echo "Working directory does not exist. Creating..."
   mkdir $workingDirectory
   echo "Working directory created"
else
   echo "Working directory exists"
fi

echo "======================================================"
echo
echo "Copying current firewall log file to working directory"
echo "------------------------------------------------------"

cp $logDirectory/filter_$date.log $workingDirectory/$dateTime.txt

if [ -f "$workingDirectory/$dateTime.txt" ]
then
   echo "Copy succeeded, continue on"
else
   echo "Copying of the firewall log file failed for some reason, exiting"
   exit 1;
fi

echo "======================================================"
echo
echo "Checking for existence of previous log file"
echo "-------------------------------------------"

if [ -f "$workingDirectory/$dateTimePrev.txt" ]
then
   echo "It exists, as expected, let's continue"
else
   echo "Previous version of the log file doesn't exist, can't do anything more, exiting"
   exit 2;
fi

echo "==========================================="
echo
echo "Diffing current log file with previous"
echo "--------------------------------------"

diff $workingDirectory/$dateTime.txt $workingDirectory/$dateTimePrev.txt > $workingDirectory/${dateTime}_Diffd.txt

if [ -f "$workingDirectory/${dateTime}_Diffd.txt" ]
then
   echo "Diff'd file exists, as expected, let's continue"
   echo "Removing the previous copied log file as it's no longer necessary..."
   rm $workingDirectory/$dateTimePrev.txt
else
   echo "Diff'd file wasn't created for some reason, can't do anything more, exiting"
   exit 3;
fi

echo "======================================"
echo
echo "Calling Script02 to extract the IP Address from the Diff'd file for the correct rule, and sort the output by IP address"
echo "-----------------------------------------------------------------------------------------------------------------------"

$scriptsDirectory/FWLogBlock_Script02.sh $dateTime $workingDirectory ${dateTime}_Diffd.txt $outputPrefix

if [ $? = 0 ]
then
   echo "Script02 completed successfully!"
else
   echo "Script02 failed with error code $?"
   exit 5;
fi

echo "======================================================================================================================="
echo

echo "Calling Script03 to add the Date and Server / Node ID to the IP address list in preparation for Database import"
echo "---------------------------------------------------------------------------------------------------------------"

$scriptsDirectory/FWLogBlock_Script03.sh $date $dateTime $workingDirectory $outputPrefix

if [ $? = 0 ]
then
   echo "Script03 completed successfully!"
else
   echo "Script03 failed with error code $?"
   exit 7;
fi

echo "==============================================================================================================="
echo

exit 0;
