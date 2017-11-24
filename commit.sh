#!/bin/bash

# This is just a simple script to commit/push
# Git pull before add/commit/push
printf "git pull"
git pull
printf "git status\n"
git status
printf "git add -A\n"
git add -A
printf "git commit\n"

message=${1}
if [ -z ${message} ]; then
	printf "Enter commit message: "
	read message
	if [ -z ${message} ]; then
		message="update/add file(s)" 
		printf "${message}\n"
	fi
fi

git commit -m "${message}"
printf "git push\n"
git push

printf "Press any key to continue...\n"
read -p ""
