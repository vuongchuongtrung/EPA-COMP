#!/bin/bash

bucket=epa-lab-week7
detail=`aws s3 ls s3://${bucket}`
count=`aws s3 ls s3://${bucket} | wc -l`

if [ ${count} > 0 ]; then
	printf "Bucket Found: \n"
	printf "${bucket}\n"
	printf "~~~~~~~~~~~~~~~\n"
	printf "${detail}\n"
else
	printf "Bucket Not Found \n"
fi
