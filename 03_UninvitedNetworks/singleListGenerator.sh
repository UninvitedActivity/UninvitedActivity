#!/bin/sh

outputFile=03_ZZUninvitedActivityNetworks.txt
inputFile=dirList.txt

echo Output File: $outputFile
echo Input File: $inputFile
rm $outputFile

ls -1 03* | grep -v ZZ | grep -v 1e100 > $inputFile

echo While loop beginning:
while IFS= read -r line
do
   echo # >> $outputFile
   cat $line >> $outputFile
   echo # >> $outputFile
   echo "" >> $outputFile
done < "$inputFile"
echo While loop ended.

echo Removing temporary input file
rm $inputFile

exit 0
