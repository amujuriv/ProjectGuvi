#!/bin/bash
sudo cp index.html /var/www/html

file="index.html"  # Replace example.txt with the filename you want to compare

# Get the timestamp of the file
file_timestamp=$(stat -c %Y "$file")

# Get the current timestamp
current_timestamp=$(date +%s)

# Compare the timestamps
if [ "$file_timestamp" -gt "$current_timestamp" ]; then
    echo "File $file is newer than the current time."
    ./build.sh&
    ./deploy.sh&
else
    echo "File $file is older than the current time."
fi

