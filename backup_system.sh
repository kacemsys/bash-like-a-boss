#!/usr/bin/env bash

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
