#!/bin/bash

# Define Variables
PROJECT_DIR="/home/devops/academy/project"
BACKUP_DIR="/home/devops/academy/backup"
BACKUP_FILE="$BACKUP_DIR/project_backup.tar.gz"

# Check if project and backup directory exist
if [ ! -d "$PROJECT_DIR" ] && [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: Project directory/backup directory $PROJECT_DIR $BACKUP_DIR does not exist."
    exit 1
fi

# Attempt to create compressed backup
if tar -czvf "$BACKUP_FILE" -C "$PROJECT_DIR" .; then
    echo "Backup Successful: $BACKUP_FILE"
else
    echo "ERROR: Backup failed during compression."
    exit 1
fi
