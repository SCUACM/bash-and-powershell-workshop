# ACM Bash and PowerShell Workshop
Bash

## Instructions

### Downloading the repository

Starting in a your Terminal ...

1. Navigate to where you want the repository to reside
2. Run ````git clone https://github.com/SCUACM/bash-and-powershell-tutorial```` to clone the repository to your device

### Running the scripts

Starting in your Terminal ...

1. Navigate into the Bash folder of the repository
3. Type ````chmod +x one.sh```` to give user permission to execute this script (one.sh is interchangeable with any other script)
2. Type ````./one.sh```` to run the script (again one.sh is interchangeable with any other script). Be sure to include any necessary arguments such as file names or paths!

### Modifying the scripts

You can use any text editor like Atom or Sublime. You can also get familiar with text editors in your terminal like Vim, Emacs, or Nano.

## Tutorial

This document will help guide you through the process of making of several different problems:
1. Make a directory, and create a text file in that directory
2. Print your username (without hardcoding the name), and then print the numbers 1 to 10
3. Given two integers, find their sum, difference, product, and quotient
4. Given two files, find the difference between the two and place the output into a new file
5. Count the number of lines in an input file. Then count the total number of lines given multiple files.
6. For each disk, report the percentage of space used
7. Rename all files in a directory to be lowercase.
8. CHALLENGE: Rename all files in a directory to be lowercase in a single command
9. CHALLENGE: Get the list of processes, sort them in the descending order by CPU, select the top 10, then export to a .csv file
10. CHALLENGE: Import the .csv file, select only the Name, CPU, and Path columns, sort by Path, then print the result

To help with these problems, here are some cheat sheets that will assist with getting basic Bash knowledge:
1. https://goo.gl/zjJ17c

### Make a directory, and create a text file in that directory
#### File: one.sh

````Bash
# Make the test directory
mkdir test

# Change directories into the test directory
cd test

# Create a file called example.txt
touch example.txt
````

### Print your username (without hardcoding the name), and then print the numbers 1 to 10
#### File: two.sh

````Bash
# Print $USER which refers to the environment variable that exists in all shell sessions
echo "Hello $USER\n"

# Iterate 10 times and print the variable i each iteration
for ((i=1;i<=10;i+=1))
do
	echo $i
done
````

### Given two integers, find their sum, difference, product, and quotient
#### File: three.sh

````Bash
# Check to see if this script was passed two arguments (integers)
if [ ! -z "$1" ] && [ ! -z "$2" ]
    # If two arguments were passed, assign them to variables
    then
        integer1=$1
        integer2=$2
    # If they were not passed, prompt the user to enter them in
    else
        echo "Enter an integer: "
        read integer1
        echo "Enter another integer: "
        read integer2
fi

# Different methods of evaluating two variables then storing to a variable
sum=$(($integer1+$integer2))
difference=$[$integer1-$integer2]
let product=$integer1*$integer2
quotient=`echo "$integer1/$integer2" | bc -l`

# Print out all variables
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
````

### Given two files, find the difference between the two and place the output into a new file
#### File: four.sh

````Bash
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
````

### Count the number of lines in an input file. Then count the total number of lines given multiple files.
#### File: five.sh

````Bash
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
````

### For each disk, report the percentage of space used
#### File: six.sh

````Bash
# The "df" command checks free space on disk
# "| awk '{ print $1 " " (100 - $5) "%" }'" will take the output of the "df" command and configure the output
# "| grep -v 'Filesystem'" will remove the top row that says Filesystem in the output
df -H | awk '{ print $1 " " $5 }' | grep -v 'Filesystem'
````

### Rename all files in a directory to be lowercase.
#### File: seven.sh

````Bash
# Set directory path to all elements found in "uppercase-files"
DIRECTORY=./script-resources/uppercase-files/*

# Iterate through all elements of DIRECTORY
for i in $DIRECTORY
do
    # 1st param of mv: "$i" is just the file name in DIRECTORY
    # 2nd param of mv: pass the file name "$i" to the "tr" command which translates from upper to lower
    mv $i `echo $i | tr [:upper:] [:lower:]`
done
````

### CHALLENGE: Rename all files in a directory to be lowercase in a single command
#### File: eight.sh

````Bash
for i in ./script-resources/uppercase-files/*; do mv $i `echo $i | tr [:upper:] [:lower:]`; done
````

### CHALLENGE: Get the list of processes, sort them in the descending order by CPU, select the top 10, then export to a .csv file
#### File: nine.sh

### CHALLENGE: Import the .csv file, select only the Name, CPU, and Path columns, sort by Path, then print the result
#### File: ten.sh
