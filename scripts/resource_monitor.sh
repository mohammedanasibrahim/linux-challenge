#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')
echo "Cpu Usage: $CPU_USAGE"

MEMORY_USAGE=$(free -h | awk '/Mem:/ {print "Used: "$3" / Total: "$2" ("$3/$2*100"%)"}')
echo "Memory usage: $MEMORY_USAGE"

DISK_USAGE=$(df -h --total | awk '/total/ {print "Used: "$3" / Total: "$2" ("$5" used)"}')
echo "Disk Usage: $DISK_USAGE"

# Run on a 5-minute schedule via cron and append to resource_usage.log:
# */5 * * * * /home/devops/academy/scripts/resource_monitor.sh >> /home/devops/academy/resource_usage.log
