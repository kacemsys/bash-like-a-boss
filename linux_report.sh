#!/bin/bash

# Function to format seconds into human-readable time
format_time() {
  local seconds=$1
  local h=$((seconds / 3600))
  local m=$((seconds % 3600 / 60))
  local s=$((seconds % 60))
  printf "%02d:%02d:%02d" $h $m $s
}

# Function to print colored text
print_color() {
  local color=$1
  local text=$2
  echo -e "\e[${color}m${text}\e[0m"
}

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Generate system report
generate_report() {
  echo "System Report"
  echo "-------------"

  # Display basic system information
  echo -e "\n$(print_color 34 "Basic System Information:")"
  echo "Hostname: $(hostname)"
  echo "Kernel Version: $(uname -r)"
  echo "CPU: $(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^[ \t]*//')"
  echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"
  echo "Disk Space: $(df -h / | awk '/^\/dev\// {print $4}') available"

  # Check the status of essential services
  echo -e "\n$(print_color 34 "Service Status Check:")"
  services=("sshd" "httpd" "mysql")
  for service in "${services[@]}"; do
    service_status=$(systemctl is-active "$service")
    uptime_seconds=0

    if [ "$service_status" == "active" ]; then
      uptime_seconds=$(systemctl show --property=ActiveEnterTimestamp --value "$service" | xargs -I{} date +%s -d "{}")
      current_time=$(date +%s)
      uptime_seconds=$((current_time - uptime_seconds))
    fi

    if [ "$service_status" == "active" ]; then
      status_color="32" # Green for running
    else
      status_color="31" # Red for any other state
    fi

    echo -e "Service $service status: $(print_color "$status_color" "$service_status"), uptime: $(format_time "$uptime_seconds")"
  done

  # Check for available updates
  if command_exists "yum"; then
    echo -e "\n$(print_color 34 "Available Updates Check:")"

        # Update available packages and notify about important updates
	important_updates=$(yum check-update -qy | grep -E 'Important|Security')
	if [[ -n "$important_updates" ]]; then
	  echo "Important updates available!"
	  echo "$important_updates"
	else
  	echo "No critical updates found. You're good to go!"
fi

  fi

  # Check disk space
  echo -e "\n$(print_color 34 "Disk Space Check:")"
  df -h

  # Check network information
  echo -e "\n$(print_color 34 "Network Information:")"
  ip addr show

  echo -e "\n$(print_color 34 "Report generation completed.")"
}

# Run the script
generate_report
