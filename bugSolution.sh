#!/bin/bash

# This script demonstrates a solution to the race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Use a lock file to prevent race conditions
lockfile=/tmp/mylockfile

# Function to write to a file safely
write_to_file() {
  local filename=$1
  local content=$2
  flock $lockfile
  echo "$content" >> $filename
  flock -u $lockfile
}

# Start two processes that use the lockfile for synchronization
(while true; do write_to_file file1.txt "Process 1 writing to file1.txt - $(date)"; sleep 1; done) &
(while true; do write_to_file file2.txt "Process 2 writing to file2.txt - $(date)"; sleep 1; done) &

# Wait for a few seconds to let the processes run
sleep 10

# Kill the background processes
kill %1
kill %2

# Display the contents of both files
cat file1.txt
cat file2.txt