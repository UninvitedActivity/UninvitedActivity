#!/bin/sh

# Version 0.2
# Date: November 19th 2023

# Variable setup
outputPrefix=$4
rule2ID=b4692a
rule3ID=592ef7
rule4ID=b80ec0
rule5ID=e9c637

# Variable confirmation - comment this out when it's all working
echo "Variable confirmations:"
echo "-----------------------" 
echo Script name: $0
echo Date time: $1
echo Working directory: $2
echo File to parse: $3
echo Output filename prefix: $outputPrefix
echo Rule Identifier: $rule2ID
echo "======================="
echo
echo "Extracting IP addresses from Diff'd file and outputting to a new file"
echo "---------------------------------------------------------------------"

# Note: The '$' variables in the awk script ($2 and $29) are separate and distinct from the '$' variables used in the rest of the script
grep "$rule2ID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1.txt
grep "$rule2ID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1-Rule2.txt
grep "$rule3ID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1-Rule3.txt
grep "$rule4ID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1-Rule4.txt
grep "$rule5ID" $2/$3 | awk -F"[ ,T]" '{gsub("-", "",$2); print $29 }' | sort -uV > $2/$outputPrefix$1-Rule5.txt


if [ -f "$2/$outputPrefix$1-Rule2.txt" ]
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
