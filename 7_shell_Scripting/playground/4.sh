#! /bin/bash
# -- count --  
count() {
    count=100
    if [ $count -eq 100 ]
    then 
        echo "Count is 100"
    else 
        echo "Count is not 100"  
    fi 
 
}
count 
# -- file exist -- 
File () {
    file="/mnt/data"
    if [ -e $file ]
    then 
        echo "file is exist" 
    else
        echo "file not exist" 
    fi 
}
File