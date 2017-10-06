#!/bin/bash

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


