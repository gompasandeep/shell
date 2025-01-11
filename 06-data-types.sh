#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
SUM=$(($NUMBER1+$NUMBER2))

echo "Output is $SUM"