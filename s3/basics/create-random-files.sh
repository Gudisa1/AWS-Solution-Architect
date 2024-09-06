#!/usr/bin/env bash

# Create 6 random files
for i in {1..6}; do
    # Generate a random file name
    FILENAME="file_$RANDOM.txt"
    
    # Generate random content for the file
    CONTENT=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)
    
    # Create the file with the random content
    echo "$CONTENT" > "$FILENAME"
    
    # Output the name of the created file
    echo "Created file: $FILENAME"
done
