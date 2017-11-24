#!/bin/bash

max=3
cnt=`ls /tmp | wc -l`

if [ ${cnt} -gt ${max} ]; then
	echo "`date` Max number of files ${cnt} exceeded in /tmp" >> home/EPA-COMP/week10/log.txt
fi


