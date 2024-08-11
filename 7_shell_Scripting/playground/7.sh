#!/bin/bash 

echo
echo "Please choose one of the options below:"
echo "a = Display Date and Time"
echo "b = List Files and Directories"
echo "c = List Users Logged In"
echo "d = Check System Uptime"
echo "x = exit"
echo
while [ "1" ]
do 
    echo "What is you Choice ?" 
    read choice 
    case $choice in 
        a) date;; 
        b) ls;;
        c) who;;
        d) uptime;;
        x) exit 1;;
        *) echo "Invalid choice ";;
    esac
done