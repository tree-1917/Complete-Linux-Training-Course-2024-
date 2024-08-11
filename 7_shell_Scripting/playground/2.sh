#!/bin/bash 

main() { 
	# Take Values From User
	read -p "Enter your name : " name
	read -p "Enter your age  : " age

	echo "Hello $name, Your Age : $age"
	return 0
}
main
