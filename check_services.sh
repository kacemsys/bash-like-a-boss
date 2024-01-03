#!/usr/bin/env bash

# Configurable list of essential services
declare -a services=("sshd" "httpd" "firewalld")

# Function to check service status
check_service_status() {
  local service_name="$1"
  local status=$(systemctl is-active "$service_name")
  echo "- $service_name: $status"
}

# Check the status of essential services
echo "Services status :$(date)" 
for service in "${services[@]}"; do
  check_service_status "$service" 
done
