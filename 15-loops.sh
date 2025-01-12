#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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

if [ $USERID -ne 0 ]
then
    echo "ERROR: You must have sudo access to execute this script"
    exit 1
fi

for package in $@

do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y .. INSTALLED $N"
    fi
done