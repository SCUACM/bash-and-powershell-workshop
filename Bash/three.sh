#!/bin/sh
# Given two integers, find their sum, difference, product, and quotient

# ----- Numbers are passed as arguments or prompted from user-----
if [ ! -z "$1" ] && [ ! -z "$2" ]
    then
        integer1=$1
        integer2=$2
    else
        echo "Enter an integer: "
        read integer1
        echo "Enter another integer: "
        read integer2
fi

# ----- Calculations (Using different methods of evaluating variables)-----
sum=$(($integer1+$integer2))
difference=$[$integer1-$integer2]
let product=$integer1*$integer2
quotient=`echo "$integer1/$integer2" | bc -l`

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
