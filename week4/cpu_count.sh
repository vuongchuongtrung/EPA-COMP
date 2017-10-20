#!/bin/bash

cnt=`grep processor /proc/cpuinfo | wc -l`

<<<<<<< HEAD
if [ ${cnt} -le ${1} ]
then
  echo "Not enough CPUS, exiting"
=======
if [ $cnt -le 2 ]; then
	echo "Two few CPUs, exiting"
else
	echo "Number CPUs: $cnt" 
fi

# https://www.cyberciti.biz/faq/unix-linux-bash-function-number-of-arguments-passed/
# on 30/09/2017, @ 11:00
# [a] All function parameters or arguments can be accessed via $1, $2, $3,..., $N.
# [b] $* or $@ holds all parameters or arguments passed to the function.
# [c] $# holds the number of positional parameters passed to the function.
# [d] An array variable called FUNCNAME ontains the names of all shell functions currently in the execution call stack.
echo "Number of parameters input: ${#}"
echo "Read first 3 parameters only!"
echo "Parameters input: $1 $2 $3"
echo "Is this correct?"

if [ $# -lt 3 ]; then
	echo "Parameters input < 3, exiting"
>>>>>>> d1b850b67f4803ef20d5734b5a24f53759bcb997
fi
