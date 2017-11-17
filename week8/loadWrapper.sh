#!/bin/bash

# N: Number of Synthetic users
# T: Duration of load test

# 1: Invoke load test
# 2: Sleep
# 3: pkill
./loadtest $1 &
sleep $2
pkill loadtest



