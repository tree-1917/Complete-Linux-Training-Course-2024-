#! /bin/bash 

# -- check number of user -- # 
if [ $# -ne 1 ]
then 
    echo "Correct command ./5.sh <number of users>"
    exit 1
fi 
number_users=$1
for (( i = 0 ; i < number_users ; i++ )) 
do 
    echo "What is Your Name :" 
    read name 
    id=$(((RANDOM % 1000000) + $i * 10))
    echo "Hello $name, Your id : $id"
    echo "$name,$id" >> ".users.csv"
    echo "----------"
done 