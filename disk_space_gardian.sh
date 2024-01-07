#!/usr/bin/env bash
#
# Low Disk Space Alert Script
# Author: Aboulkacem KRADRA (@Kacemsys)
#
# Description:
#   This script identifies mounted partitions with less than 10% free space
#   and displays a warning message if any are found.
#

# Find all mounted partitions with less than 10% free space
low_disks=$(df -H | awk '{print $5}' | grep -E '^([0-9]+)$' | awk 'NR>1 {if ($1 < 10) print $0}')

# Check if there are any partitions with low disk space
if [[ -n "$low_disks" ]]; then
  echo "Low disk space alert!"

  # Display warning messages for each partition with low space
  echo "$low_disks" | xargs -n1 -I {} bash -c 'echo -e "\n\033[31mWARNING:\033[0m Partition {} is nearly full! Free space: {}%"'

  # Exit with a non-zero status code to indicate an issue
  exit 1
fi

# Display message indicating that disk space is healthy
echo "Disk space healthy!"
