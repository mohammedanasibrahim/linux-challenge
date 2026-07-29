#!/bin/bash

LOG_FILE="/home/devops/academy/timestamp.txt"
BACKUP_DIR="/home/devops/academy/logs"
MAX_SIZE=1048576   # 1 MB in bytes

# Check if the log file exceeds 1 MB
if [ -f "$LOG_FILE" ] && [ "$(stat -c%s "$LOG_FILE")" -gt "$MAX_SIZE" ]; then
    mv "$LOG_FILE" "${LOG_FILE%.*}_$(date +%Y%m%d_%H%M%S).${LOG_FILE##*.}"
    echo "Log rotated"
else
    echo "Log rotation not needed"
fi
