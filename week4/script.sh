#!/bin/bash

<<<<<<< HEAD
# ${variable}, using {} in order to work with gitbash

echo parameters input: ${1} ${2}

if [ ${#} -lt 2 ] 
then
	echo too few parameters, exiting...
fi

if [ ! -d ${1} ]
then
	mkdir ${1}
	echo ${1} created
fi

if [ ! -d ${2} ]
then
	mkdir ${2}
	echo ${2} created
fi


=======
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
>>>>>>> d1b850b67f4803ef20d5734b5a24f53759bcb997
