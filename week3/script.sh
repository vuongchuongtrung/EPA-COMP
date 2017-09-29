#!/bin/bash

# this is a CPU counting script

cnt=`grep processor /proc/cpuinfo | wc -l`

if [ $cnt -le 2 ]; then
 echo "Two few CPUs, exiting"
fi


