#!/bin/bash

# 1. the script runs mpstat for 10 seconds and collects one sample of output
# 2. the script uses pipe to jq to have jq identify the cpu-load value from mpstat
# 3. the script uses jq to subtract this number from 100 to obtain the utilization of the cpu

busyTime=`mpstat -o JSON 10 1 | jq -C '100 - .sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`
printf "Busy time = ${busyTime} \n"
