#!/bin/bash

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Present Working Directory: $PWD"
echo "home directory of current user: $USER"
echo "which user is running this script" $USER"
echo "Process ID of current script: $$"
sleep 60 &
echo "Process ID of last command in background: $!"