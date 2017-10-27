#!/bin/bash

id=${1}
if [ -n ${id} ]; then
	id=i-033390d4b2e4fb049
fi

status=`aws ec2 describe-instance-status --instance-ids ${id} --query InstanceStatuses[*].InstanceState.Name  --output table`
if [ -z ${status} ]; then
	printf "Instance NOT existing|running\n"
else
	printf "Instance running\n"
fi





