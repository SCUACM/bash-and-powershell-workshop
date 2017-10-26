#!/bin/sh
# Given two similar files, find the difference between the two and write to a
# new file

if [ -z "$1" ] || [ -z "$2" ]
    then
        echo "ERROR: Two arguments are required"
        exit
fi

if [[ -f "out.txt" ]]
    then
        rm out.txt
fi

diff $1 $2 -y >> out.txt

# 1. diff $1, $2
# 2. >> out.txt
# 3. Do not want to keep appending to out.txt
# 4. This text is ugly ... let's use "man" to figure out how to do this better
# 5. Quit the program if you do not have two inputs
