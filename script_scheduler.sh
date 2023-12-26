#!/bin/bash

# Script Scheduler
# Automate Your Tasks with Ease

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if the user has necessary privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script requires superuser privileges to configure cron."
  exit 1
fi

# Inform the user about the script's purpose
echo "Welcome to the Script Scheduler!"
echo "This script allows you to automate your custom tasks by scheduling them with cron."

# Prompt the user for the script to schedule
read -p "Enter the full path of the script you want to schedule: " script_path

# Check if the specified script exists
if [ ! -f "$script_path" ]; then
  echo "Error: The specified script does not exist. Please provide a valid script path."
  exit 1
fi

# Prompt the user for the schedule interval
read -p "Enter the schedule interval (e.g., '* * * * *' for every minute): " cron_interval

# Add the cron job
(crontab -l ; echo "$cron_interval $script_path") | crontab -

# Verify if the cron job was added successfully
if [ $? -eq 0 ]; then
  echo "Cron job added successfully. Your script will run according to the specified schedule."
else
  echo "Error: Failed to add the cron job. Please check your cron configuration."
fi
 
