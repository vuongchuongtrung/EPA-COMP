#!/bin/bash

# 1. the script runs mpstat for 10 seconds and collects one sample of output
# 2. the script uses pipe to jq to have jq identify the cpu-load value from mpstat
# 3. the script uses jq to subtract this number from 100 to obtain the utilization of the cpu

# -P 0: first cpu only (CPU 0)
# Perform string is none-zero check (simple check)
if [ -n $1 ]; then
	if [ -n $2 ]; then
		#utilisation=`mpstat -P 0 -o JSON $1 $2 | jq '100 - .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`
		utilisation=`mpstat -o JSON 10 1 | jq -C '100 - .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`
		printf "utilisation = ${utilisation} \n"
	else
		printf "1\n"
	fi
else
	printf "2\n"
fi

