#!/usr/bin/env bash

# Inform the user that the script is running
echo "Checking for updates. Please wait..."

# Update available packages and notify about important updates
important_updates=$(yum check-update -qy | grep -E 'Important|Security')

if [[ -n "$important_updates" ]]; then
  echo "Important updates available!"
  echo "$important_updates"
else
  echo "No critical updates found. You're good to go!"
fi

# Inform the user that the script has finished
echo "Update check completed."


