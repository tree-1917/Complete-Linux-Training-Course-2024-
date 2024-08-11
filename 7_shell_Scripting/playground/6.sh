#!/bin/bash

user_file="./.users.csv"

# -- Check users file -- 
if [ -e "$user_file" ]; then
    echo "Hello Sir, you can login >>>" 
else 
    echo "There are no users" 
    exit 1 
fi 

# --- Take ID from User --- 
tries=3

# Take username
echo "Enter your name:" 
read name

# Check if username exists in the file
if grep -q "^$name," "$user_file"; then 
    correct_passwds=$(grep "^$name," "$user_file" | awk -F, '{for(i=2;i<=NF;i++) print $i}')
    while [ $tries -gt 0 ]; do
        echo "Enter your password:"
        read passwd 
        # Check if entered password matches any of the correct passwords
        if echo "$correct_passwds" | grep -q "^$passwd$"; then
            echo "Hello Sir"
            exit 0
        else 
            tries=$((tries - 1))
            echo "Incorrect password. You have $tries tries left."
        fi 
    done
    echo "No tries left. Access denied."
else 
    echo "Username not found."
    exit 1
fi
