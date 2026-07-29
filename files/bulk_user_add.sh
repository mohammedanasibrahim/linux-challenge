#!/bin/bash

GROUP="students"
PASSWORD="Welcome@123"
USER_LIST="user_list.txt"

groupadd -f "$GROUP"

while IFS= read -r USER; do
    useradd -m -g "$GROUP" "$USER"
    echo "$USER:$PASSWORD" | chpasswd
done < "$USER_LIST"

echo "Users added successfully."
