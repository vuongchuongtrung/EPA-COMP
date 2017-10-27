#!/bin/bash
#x00123430

if [ $# -eq 0 ]; then
	echo "No Instance entered on command line"	
else
#status=`aws ec2 describe-instance-status --instance-ids $1 --query InstanceStatuses[*].InstanceState.Name  --output table`
status=`aws ec2 describe-instance-status --instance-ids $1 
#echo status >> kevin_test.txt`
if [ ! -z "$status" ]; then
	echo "Instance running"
	echo "Status: [$status]"
else
echo "Instance is not running"
fi
fi


echo "Script Finished Running"
