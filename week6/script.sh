#!/bin/bash

id=${1}
# if user do not pass in instance ids, default instance ids will be set
if [ -n ${id} ]; then
	id=i-033390d4b2e4fb049
fi

# status=`aws ec2 describe-instance-status --instance-ids ${id} --query InstanceStatuses[*].InstanceStatus`
# append status to file
# aws ec2 describe-instance-status --instance-ids ${id} >> ${fileName}
# count "running", but now not used
# run=`grep running ${fileName} | wc -l`
fileName=status.txt
aws ec2 describe-instance-status --instance-id ${id} > ${fileName}
count=`grep running ${fileName} | wc -l`

# get current date-time
details=`date`
# will override, just want to keep fresh details
printf "Checked at: ${details}\n" > ${fileName}
printf "Status: \n" >> ${fileName}

if [ ${count} -gt 0 ]; then
	printf "${id}: running\n" >> ${fileName}
else
	printf "${id}: blank/no result\n" >> ${fileName}
fi

# print out message letting user know the script has run and finished
printf "${Yellow}Script ran and finished${Color_Off}\n"


aws ec2 describe-instance-status --instance-id i-033390d4b2e4fb049
aws ec2 describe-instance-status --instance-id i-07bc96b8192810fe0