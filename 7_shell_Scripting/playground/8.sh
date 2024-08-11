#!/bin/bash

# -- ping -- # 

hosts="./hosts"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for host in $(cat $hosts) 
do 
    ping -c1 $host > /dev/null 2>&1
    if [ $? -eq 0 ]
    then 
     echo -e "${GREEN}$host is ok${NC}"
    else 
     echo -e "${RED}$host not ok${NC}"
    fi 
done
