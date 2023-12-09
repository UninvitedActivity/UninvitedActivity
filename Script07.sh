#!/bin/sh

# Version 0.2
# Date: November 20th 2023

# Variable setup
updateDate=`date --date="-2 minute" "+%H:%M on %A %d %B %Y"`
dumpFile=uninvitedActivity
startingDirectory=/home/<user>/UninvitedActivity
gitDirectory=$startingDirectory/UninvitedActivity
comment="Blocklist update: $updateDate"

# Variable confirmation - comment this out when it's all working
echo "Variable confirmations:"
echo "-----------------------" 
echo Update Date: $updateDate
echo IP address dump file: $dumpFile
echo Starting directory: $startingDirectory
echo Git Directory: $gitDirectory
echo Git commit comment: $comment
echo "========================"
echo

# Start execution in the correct firectory
cd $startingDirectory

# Move the IP address dump file to the git directory
cp $dumpFile* $gitDirectory

# Move execution to the git directory
cd $gitDirectory

# Git add the blocklist update file
git add uninvitedActivity-Export.txt
git add uninvitedActivity-Rule1.txt
git add uninvitedActivity-Rule2.txt
git add uninvitedActivity-Rule4.txt
git add uninvitedActivity-Rule3.txt
git add uninvitedActivity-Rule5.txt

# Git commit with comment
git commit -m "$comment"

# Git push, send it baby!
git push

# ==========
# CHANGE LOG
# ==========
# V 0.2
# -----
# - Additional 'git add's for the additional specific rule files
# - dumpFile variable changed so it can be wildcard'd
