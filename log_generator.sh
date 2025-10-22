#!/bin/bash
# save as generate_logs.sh

HOSTNAME=$(hostname)
FACILITIES=("auth" "authpriv" "user" "daemon" "kern")
SEVERITIES=("info" "warning" "err" "debug")
MESSAGES=(
    "User login successful"
    "Failed password for user"
    "Database connection established"
    "Disk space running low"
    "Network interface eth0 link up"
    "CRON job completed"
    "SSH session opened"
    "Authentication failure"
    "Service started successfully"
    "Error processing request"
)

while true; do
    FACILITY=${FACILITIES[$RANDOM % ${#FACILITIES[@]}]}
    SEVERITY=${SEVERITIES[$RANDOM % ${#SEVERITIES[@]}]}
    MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

    logger -p $FACILITY.$SEVERITY "TEST: $MESSAGE [PID: $$]"

    sleep 1
done
