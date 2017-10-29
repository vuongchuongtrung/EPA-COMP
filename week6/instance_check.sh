#!/bin/bash

logPath=/home/epa/EPA-COMP/log
dummy=dummy.txt
log=log.txt

id1=${1}
id2=${2}
# if user do not pass in instance ids, default instance ids will be set
if [ -n ${id1} ]; then
	id1=i-033390d4b2e4fb049
fi

if [ -n ${id2} ]; then
	id2=i-07bc96b8192810fe0
fi


if [ ! -e ${dummy} ]; then
	touch "${logPath}/${dummy}"
fi

if [ ! -e "${logPath}/${log}" ]; then
	touch "${logPath}/${log}"
fi


aws ec2 describe-instance-status --instance-id ${id1} > "${logPath}/${dummy}"
count=`grep running ${logPath}/${dummy} | wc -l`
# get current date-time
dateTime=`date`
if [ ${count} -gt 0 ]; then
	printf "${dateTime}\t${id1}\t the instance  is running\n" >> "${logPath}/${log}"
else
	printf "${dateTime}\t${id1}\t no such instance running\n" >> "${logPath}/${log}"
fi

aws ec2 describe-instance-status --instance-id ${id2} > "${logPath}/${dummy}"
count=`grep running ${logPath}/${dummy} | wc -l`
# get current date-time
dateTime=`date`
if [ ${count} -gt 0 ]; then
	printf "${dateTime}\t${id2}\t the instance  is running\n" >> "${logPath}/${log}"
else
	printf "${dateTime}\t${id2}\t no such instance running\n" >> "${logPath}/${log}"
fi

# clean up unwanted file by removing/deleting dummy.txt
# but no clean up for now for cronjob as recycle bin will fill up
# rm -rf "${logPath}/${dummy}"
