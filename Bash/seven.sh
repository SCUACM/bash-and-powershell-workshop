#!/bin/sh
# Rename all files in a directory to be lowercase.

# Set directory path to all elements found in "uppercase-files"
DIRECTORY=./script-resources/uppercase-files/*

# Iterate through all elements of DIRECTORY
for i in $DIRECTORY
do
    # 1st param of mv: "$i" is just the file name in DIRECTORY
    # 2nd param of mv: pass the file name "$i" to the "tr" command which translates from upper to lower
    mv $i `echo $i | tr [:upper:] [:lower:]`
done
