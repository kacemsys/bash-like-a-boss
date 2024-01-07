#!/usr/bin/env bash
#
# Your id Please !
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   A script that empowers your Linux system to identify itself by providing essential system information, 
#   including the hostname, kernel version, CPU details, memory status, and available disk space. 
#   Display basic system information

echo "System Information:"
echo "-------------------"

# Display hostname
echo "Hostname: $(hostname)"

# Display kernel version
echo "Kernel Version: $(uname -r)"

# Display CPU model
echo "CPU: $(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^[ \t]*//')"

# Display available memory
echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"

# Display available disk space
echo "Disk Space: $(df -h / | awk '/^\/dev\// {print $4}') available"
