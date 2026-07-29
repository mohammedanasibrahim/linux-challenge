#!/bin/bash

# ====== CONFIGURATION ======
EMAIL="you@example.com"   # replace with your real alert email
CPU_THRESHOLD=80
DISK_THRESHOLD=20
HOSTNAME=$(hostname)

# ====== CHECK CPU USAGE ======
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "High CPU Usage Alert on $HOSTNAME
Current CPU Usage: $CPU_USAGE%" \
    | mail -s "High CPU Usage Alert ($CPU_USAGE%)" "$EMAIL"
fi

# ====== CHECK DISK SPACE ======
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
DISK_FREE=$((100 - DISK_USAGE))

if [ "$DISK_FREE" -lt "$DISK_THRESHOLD" ]; then
    echo "Low Disk Space Alert on $HOSTNAME
Available Disk Space: $DISK_FREE%" \
    | mail -s "Low Disk Space Alert ($DISK_FREE% free)" "$EMAIL"
fi
