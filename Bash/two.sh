#!/bin/sh
# Print your username (without hardcoding the name), and then print the
# numbers 1 to 10

# $USER refers to the environment variable that exists in all shell sessions
echo "Hello $USER\n"

# Iterate 10 times and print the variable i each iteration
for ((i=1;i<=10;i+=1))
do
	echo $i
done

# ----- Alternative Options -----
# Below, you can simply find other ways to iterate through a list of numbers

# for i in {1..10}
# do
# 	echo $i
# done

# for i in 1 2 3 4 5 6 7 8 9 10
# do
# 	echo $i
# done
