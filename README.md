# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two background processes write to separate files concurrently, leading to potential data corruption or incomplete output.  The solution provides a method to prevent this race condition using process synchronization.