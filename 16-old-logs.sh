#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/ec2-user/shell/app-logs"

LOGS_FOLDER="/var/logs/shellscript-logs" #to save logs in this folder
LOGS_FILE=$( echo $0 | cut -d "." -f1 ) #echo $0 to print script name; 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ] 
        then
            echo -e "$2 ... $R FAILURE $N"
            exit 1
        else
            echo -e "$2 ... $G SUCCESS $N"
        fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=(find $SOURCE_DIR -name "*log" -mtime +14)
echo "Files to be deleted: $FILES_TO_DELETE"
