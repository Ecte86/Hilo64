#!/usr/bin/env bash

# set a variable for all arguments passed to this script
# (Note: Since we are using sh, we need to use printf to add a
# space between each argument)
args="$*"

# Run the binary with all arguments passed to this script from make
x64sc "$args" &

# Get the PID of the last process run in the background
pid=$!

# Disown the process so that it doesn't get killed when this script exits
disown $pid

# Exit this script
exit 0
