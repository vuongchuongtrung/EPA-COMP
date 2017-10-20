#!/bin/bash

id=$1
if [ -n $id ]; then
	#printf "Enter instance id: "
	#read id
	id=i-033390d4b2e4fb049
fi

aws ec2 describe-instance-status --instance-ids $id --query InstanceStatuses[*].InstanceState.Name  --output table


printf "\nFinished, Good Job...\n"

