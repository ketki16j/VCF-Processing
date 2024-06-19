#!/bin/bash
##pass arguments to the script

echo $1 $2 $3
echo "argument passed by users are $1 $2 $3"

#pass arguments to the script in form of an array:
args=("$@")
echo "arguments passed by user are ${args[1]}, ${args[2]}"
