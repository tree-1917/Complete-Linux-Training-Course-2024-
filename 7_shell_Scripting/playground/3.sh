#!/bin/bash

main() {
    # Initialize variables
    user_in=0
    target_in=$(( (RANDOM % 100) + 1 )) # Generate a random target number between 1 and 100
    tries=3
    
    # Inform the user (This line is not necessary in the final game but useful for debugging)
    echo "Target number: $target_in"
    
    # Loop until the user guesses correctly or runs out of tries
    while [ "$user_in" -ne "$target_in" ]; do
        # Prompt user for input
        read -p "Enter a number between 1 and 100: " user_in
        
        # Decrement tries
        tries=$(( tries - 1 ))
        
        # Check if the user has used all tries
        if [ "$tries" -eq 0 ]; then
            echo "You lose! The target number was $target_in."
            return 1
        fi
        
        # Inform the user if their guess is incorrect
        echo "Incorrect. You have $tries tries left."
    done
    
    # If the user guesses correctly
    echo "You win!"
    return 0
}

main

