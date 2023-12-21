#!/bin/bash
# Display basic system information
echo "System Information:"
echo "-------------------"
echo "Hostname: $(hostname)"
echo "Kernel Version: $(uname -r)"
echo "CPU: $(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^[ \t]*//')"
echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Disk Space: $(df -h / | awk '/^\/dev\// {print $4}') available"
