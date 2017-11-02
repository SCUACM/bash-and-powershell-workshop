#!/bin/sh
# Count the number of lines in an input file. Then count the total number of
# lines given multiple files.

counter=0

# This outer loop iterates through all arguments passed to the script
for i in $@
do
    # This inner loop reads all lines of the current argument from the outer loop
    while read line
    do
        counter=$(($counter+1)) # Increment the counter
    done < $i
done

echo "Number of lines: $counter"
