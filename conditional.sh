#!/bin/bash

##shell scripting for conditional statements:
##for integer comparison:
echo "enter a number to be evaluated:"
read num
if [ $num -gt 0 ] 
then
echo "entered number is greater than 0"
fi


##for string comparison:
echo "enter two names:"
read name1 name2
echo "entered names are: $name1, $name2"
if [ $name1 == $name2 ]
then
echo "entered names are same"
fi

if [ "$name1" != "$name2" ]
then
echo "names are different"
fi



##if-else statement:
myvar=67
echo "enter user defined number:"
read num1
if [ $num1 -ge $myvar ]
then
echo "user number is greater than equal"
else
echo "user number is smaller"
fi


##multiple conditions using if-elif-else statements:
echo "enter a value:"
read num2
if [ $num2 -gt 0 ] 
then
echo "value greater than 0"
elif [ $num2 -lt 0 ]
then
echo "value less than 0"
else
echo "not"
fi
