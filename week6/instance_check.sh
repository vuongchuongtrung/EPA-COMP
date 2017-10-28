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

status1=`aws ec2 describe-instance-status --instance-id ${id1}`
count1=`grep running ${status1} | wc -l`

status2=`aws ec2 describe-instance-status --instance-id ${id2}`
count2=`grep stopped ${status2} | wc -l`

printf "Status: \n" >> ${fileName}
if [ ${count1} -gt 0 ]; then
	printf "${id1}: running\n" >> ${fileName}
else
	printf "${id1}: blank/no result\n" >> ${fileName}
fi

if [ ${count2} -gt 0 ]; then
	printf "${id2}: running\n" >> ${fileName}
else
	printf "${id2}: blank/no result\n" >> ${fileName}
fi

# print out message letting user know the script has run and finished
printf "${Yellow}Script ran and finished${Color_Off}\n"
