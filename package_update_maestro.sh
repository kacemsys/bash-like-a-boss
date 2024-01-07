#!/bin/bash
#
# System Update Check Script
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   This script checks for available updates on the system, specifically highlighting
#   important and security-related updates. It informs the user about the status of
#   critical updates and whether the system is up-to-date.
#

# Inform the user that the script is running
echo "Checking for updates. Please wait..."

# Update available packages and notify about important updates
important_updates=$(yum check-update -qy | grep -E 'Important|Security')

# Check if there are any important updates
if [[ -n "$important_updates" ]]; then
  echo "Important updates available!"

  # Display the list of important updates
  echo "$important_updates"
else
  # No critical updates found
  echo "No critical updates found. You're good to go!"
fi

# Inform the user that the script has finished
