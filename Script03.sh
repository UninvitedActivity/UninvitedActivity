#!/bin/sh

# Version 1.0
# Date: October 3rd 2023

# Variable setup
inputPrefix=$4
# The serverNode value is to track which server node the Univited Activity was reported by, in case that's useful
serverNode=<_Server Node Identifier_>
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
echo "Processing the input IP Address list file line by line to add Date and Server / Node ID for upload to the database"
echo "------------------------------------------------------------------------------------------------------------------"

while IFS= read -r line
do
   echo "$1,$line,$serverNode" >> $3/$outputFilename
done < "$3/$inputPrefix$2.txt"

if [ -f "$3/$outputFilename" ]
then
   echo "Database upload file created successfully"
   echo "Removing raw IP address file..."
   rm $3/$4$2.txt
   echo "Showing the database upload file: "
   cat $3/$outputFilename
else
   echo "No database upload file created for some reason, exiting"
   exit 6;
fi

echo
echo "==================================================================================================================="

exit 0;
