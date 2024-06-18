#!/bin/bash

log_file="/var/log/cpu_monitor.log"

cpu_usage=$(uptime | awk -F'[a-z]:' '{ print $2 }' | sed 's/,//g' | awk '{ print $4 }')

current_time=$(date +"%Y-%m-%d %T")

cpu_usage=$(printf "%.2f" $cpu_usage)

cpu_threshold=75

if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
    echo "High CPU usage detected at $current_time. CPU Usage: $cpu_usage%" >> "$log_file"
fi

