#!/usr/bin/env bash
#
# System Configuration Backup Script
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   This script creates a backup of the system configuration files in the /etc directory.
#   Backups are stored in a specified directory with a timestamp in the filename.
#   The script also verifies the success of the backup process and displays a list
#   of available backups in the backup directory.
#

# Directory to store backups
backup_dir="/backup"

# Ensure the backup directory exists
mkdir -p "$backup_dir"

# Create a timestamp for the backup file
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_file="$backup_dir/etc_backup_$timestamp.tar.gz"

# Backup /etc directory
tar -czf "$backup_file" /etc

# Verify the backup process
if [ $? -eq 0 ]; then
  echo "System configuration successfully backed up to: $backup_file"
else
  echo "Backup process failed. Check for errors."
fi

# Display the list of backups in the backup directory
echo -e "\nList of available backups:"
ls -lh "$backup_dir"
