#!/usr/bin/env bash

# Find all mounted partitions with less than 10% free space
low_disks=$(df -H | awk '{print $5}' | grep -E '^([0-9]+)$' | awk 'NR>1 {if ($1 < 10) print $0}')

if [[ -n "$low_disks" ]]; then
  echo "Low disk space alert!"
  echo "$low_disks" | xargs -n1 -I {} bash -c 'echo -e "\n\033[31mWARNING:\033[0m Partition {} is nearly full! Free space: {}%"'
  exit 1
fi

echo "Disk space healthy!"
