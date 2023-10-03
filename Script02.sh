#!/bin/sh

# Variable setup
outputPrefix=$4
ruleID=<_Rule Identifier_>

# Variable confirmation - comment this out when it's all working
echo "Variable confirmations:"
echo "-----------------------" 
echo Script name: $0
echo Date time: $1
echo Working directory: $2
echo File to parse: $3
echo Output filename prefix: $outputPrefix
echo Rule Identifier: $ruleID
echo "======================="
echo
echo "Extracting IP addresses from Diff'd file and outputting to a new file"
echo "---------------------------------------------------------------------"

# Note: The '$' variables in the awk script ($2 and $29) are separate and distinct from the '$' variables used in the rest of the script
grep "$ruleID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1.txt

if [ -f "$2/$outputPrefix$1.txt" ]
then
   echo "IP Address list file created successfully"
   echo "Removing Diff'd file..."
   rm $2/$3
   echo "Showing the IP address list: "
   cat $2/$outputPrefix$1.txt
else
   echo "No IP Address list file created for some reason, exiting"
   exit 4;
fi

echo
echo "====================================================================="

exit 0;
