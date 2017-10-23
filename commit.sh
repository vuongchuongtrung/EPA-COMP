#!/bin/bash

message=$1
if [ -z $message ]; then
	printf "Enter commit message: "
	read message
fi

git add -A
git commit -m "$message"
git push

