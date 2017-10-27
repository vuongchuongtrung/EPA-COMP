#!/bin/bash

id=${1}
if [ -n ${id} ]; then
	id=i-033390d4b2e4fb049
fi

#status=`aws ec2 describe-instance-status --instance-ids ${id} --query InstanceStatuses[*].InstanceState.Name=="stopped" --output table`
aws ec2 describe-instance-status --instance-ids ${id}
cnt=`grep running status.txt | wc -l`
if [ ${cnt} -gt 0 ]; then
	echo "The instance is running\n"
else
	echo "Instance stopped\n"
fi
