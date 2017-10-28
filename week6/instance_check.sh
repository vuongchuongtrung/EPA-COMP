#!/bin/bash

id1=${1}
id2=${2}

# if user do not pass in instance ids, default instance ids will be set
if [ -n ${id1} ]; then
	id1=i-033390d4b2e4fb049
fi

if [ -n ${id2} ]; then
	id2=i-07bc96b8192810fe0
fi

fileName=checkInstance.txt
# get current date-time
details=`date`
# will overrid1e, just want to keep fresh details
printf "Checked at: ${details}\n" > ${fileName}
printf "Status: \n" >> ${fileName}

# status=`aws ec2 describe-instance-status --instance-id1s ${id1} --query InstanceStatuses[*].InstanceStatus`
# append status to file
# aws ec2 describe-instance-status --instance-id1s ${id1} >> ${fileName}
# count "running", but now not used
# run=`grep running ${fileName} | wc -l`

status1=`aws ec2 describe-instance-status --instance-id1s ${id1}`
count1=`grep running ${status1} | wc -l`
printf "${count1}\n"
status2=`aws ec2 describe-instance-status --instance-id1s ${id2}`

printf "Status: " >> ${fileName}
if [ ${run} -gt 0 ]; then
	printf "running" >> ${fileName}
else
	printf "blank" >> ${fileName}
fi

# print out message letting user know the script has run and finished
printf "${Yellow}Script ran and finished${Color_Off}\n"
