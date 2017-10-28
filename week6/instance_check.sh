#!/bin/bash

id=${1}
# if user do not pass in instance id, a default instance id will be set
if [ -n ${id} ]; then
	id=i-033390d4b2e4fb049
fi

fileName=checkInstance.txt
# get current date-time
details=`date`
# will override, just want to keep fresh details
printf "Checked at: ${details}" > ${fileName}

#status=`aws ec2 describe-instance-status --instance-ids ${id} --query InstanceStatuses[*].InstanceStatus`

# append status to file
# aws ec2 describe-instance-status --instance-ids ${id} >> ${fileName}
aws ec2 describe-instance-status --instance-ids ${id}
# counting running in the file 
run=`grep running ${fileName} | wc -l`

printf "Status: " >> ${fileName}
if [ ${run} -gt 0 ]; then
	printf "running" >> ${fileName}
else
	printf "blank" >> ${fileName}
fi

# print out message letting user know the script has run and finished
printf "${Yellow}Script ran and finished${Color_Off}\n"
