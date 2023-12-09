#!/bin/sh

# Version 0.3
# Date: November 20th 2023

# Variable setup
inputPrefix=$4
# The serverNode value is to track which server node the Uninvited Activity was reported by, in case that's useful
serverNode=AuResGVH
scanType=lowPorts
outputFilename=${1}_DBImportReady.csv

# Variable confirmation - comment this out when it's all working
echo "Variable confirmations:"
echo "-----------------------" 
echo Script name: $0
echo Date: $1
echo Date time: $2
echo Working directory: $3
echo Input filename prefix: $inputPrefix
echo "======================="
echo
echo "Removing the previous database upload file so we don't just keep adding to it"
echo "-----------------------------------------------------------------------------"

if [ -f "$3/$outputFilename" ]
then
  rm $3/$outputFilename
  echo "about to recreate an empty $3/$outputFilename"
  touch $3/$outputFilename
fi

echo "Processing the input IP Address list file line by line to add Date and Server / Node ID for upload to the database"
echo "------------------------------------------------------------------------------------------------------------------"

# Default
#
#while IFS= read -r line
#do
#   echo "$1,$line,$serverNode,$scanType" >> $3/$outputFilename
#done < "$3/$inputPrefix$2.txt"

# Rule #2

scanType=lowPorts

while IFS= read -r line
do
   echo "$1,$line,$serverNode,$scanType" >> $3/$outputFilename
done < "$3/$inputPrefix$2-Rule2.txt"

# Rule #3

scanType=highPorts

while IFS= read -r line
do
   echo "$1,$line,$serverNode,$scanType" >> $3/$outputFilename
done < "$3/$inputPrefix$2-Rule3.txt"

# Rule #4

scanType=loHiPorts

while IFS= read -r line
do
   echo "$1,$line,$serverNode,$scanType" >> $3/$outputFilename
done < "$3/$inputPrefix$2-Rule4.txt"

# Rule #5

scanType=anyIPv4

while IFS= read -r line
do
   echo "$1,$line,$serverNode,$scanType" >> $3/$outputFilename
done < "$3/$inputPrefix$2-Rule5.txt"

if [ -f "$3/$outputFilename" ]
then
   echo "Database upload file created successfully"
   echo "Removing raw IP address file..."
   rm $3/$inputPrefix$2.txt
   rm $3/$inputPrefix$2-Rule2.txt
   rm $3/$inputPrefix$2-Rule3.txt
   rm $3/$inputPrefix$2-Rule4.txt
   rm $3/$inputPrefix$2-Rule5.txt
   echo "Showing the database upload file: "
   cat $3/$outputFilename
else
   echo "No database upload file created for some reason, exiting"
   exit 6;
fi

echo
echo "==================================================================================================================="

exit 0;

# ==========
# CHANGE LOG
# ==========
# version 0.3
# -----------
# Added the Rule #2 - Rule #5 processing to the output file, with differing scanType values depending on the rule
# Commented out the Default processing to the output file
