#!/bin/bash
# Background process that logs current date and time every minute

while true
do
    DATE=$( date +"%d-%m-%Y" )
    TIME=$( date +"%H:%M:%S" )

    echo "Current date is : $DATE" >> timestamp.txt
    echo "Current Time is : $TIME" >> timestamp.txt
    echo "_______________________" >> timestamp.txt
    sleep 60
done
