#!/bin/bash
#get user input by using read command
echo "enter 3 usernames"
read name1 name2 name3
echo "the entered user names are $name1 , $name2 , $name3"


#script to input username and password using read:

read -p "username enter :" user
read -sp "password enter "  password
echo "username and password entered by user are $user, $password"


##for array inputs:
echo "entered names: "
read -a names
echo "entered names are: ${names[o]}, ${names[1]}"
~

