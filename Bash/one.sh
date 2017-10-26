#!/bin/sh

# Hello, {user} \n {for-loop printing out numbers 1-10}

echo "Hello $USER\n"

for ((i=1;i<=10;i+=1))
do
	echo $i
done

# ----- Alternative Options -----
# for i in {1..10}
# do
# 	echo $i
# done

# for i in 1 2 3 4 5 6 7 8 9 10
# do
# 	echo $i
# done
