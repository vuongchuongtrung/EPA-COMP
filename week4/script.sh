#!/bin/bash

# lab4
# two arguments passing
count=2;

if [ $# -lt $count ]; then
	echo "too few arguments, exiting..."
else
	if [ -d $1 ]; then
		echo "$1 directory existed"
	else
		mkdir $1
		echo "$1 directory created"
	fi

	if [ -d $2 ]; then
		echo "$2 directory existed"
	else
		mkdir $2
		echo "$2 directory created"
	fi
fi
