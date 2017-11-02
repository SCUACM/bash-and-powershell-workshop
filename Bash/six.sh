#!/bin/sh
# For each disk, report the percentage of space used

# The "df" command checks free space on disk
# "| awk '{ print $1 " " (100 - $5) "%" }'" will take the output of the "df" command and configure the output
# "| grep -v 'Filesystem'" will remove the top row that says Filesystem in the output
df -H | awk '{ print $1 " " $5 }' | grep -v 'Filesystem'
