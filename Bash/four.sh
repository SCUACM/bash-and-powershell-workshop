#!/bin/sh
# Given two files, find the difference between the two and place the output into
# a new file

# If the user does not pass exactly 2 arguments, exit the program
if [ -z "$1" ] || [ -z "$2" ]
    then
        echo "ERROR: Two arguments are required"
        exit
fi

# If the file "out.txt" exists, let's remove that file
if [[ -f "./script-resources/out.txt" ]]
    then
        rm out.txt
fi

# Take the difference between two files and places the output to a new file "out.txt"
diff $1 $2 -y >> ./script-resources/out.txt


# ----- Presentation Notes -----
# 1. diff $1, $2
# 2. >> out.txt
# 3. Do not want to keep appending to out.txt
# 4. This text is ugly ... let's use "man" to figure out how to do this better
# 5. Quit the program if you do not have two inputs
