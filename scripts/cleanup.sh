#!/bin/bash

# Variables
SOURCE_DIR="/home/devops/academy/backup"
DAYS=7

# Find the list of files older than 7 days and delete them
for i in $(find "$SOURCE_DIR" -type f -mtime +"$DAYS"); do
    echo "Deleting old file: $i"
    rm -f "$i"
done

echo "Cleanup done successfully"

# Cron entry to run this daily at 4:30 AM (add via `crontab -e`):
# 30 4 * * * /home/devops/academy/backup/cleanup.sh > cleanup.log
