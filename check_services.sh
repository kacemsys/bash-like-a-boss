#!/usr/bin/env bash
#
# Essential Services Status Check Script
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   This script checks and displays the status of essential services on the system.
#   The list of essential services is configurable, and the script uses systemctl
#   to check the status of each service. The results include the service name and
#   its current status.
#

# Configurable list of essential services
declare -a services=("sshd" "httpd" "firewalld")

# Function to check service status
check_service_status() {
  local service_name="$1"
  local status=$(systemctl is-active "$service_name")
  echo "- $service_name: $status"
}

# Check the status of essential services
echo "Services status : $(date)" 
for service in "${services[@]}"; do
  check_service_status "$service" 
done
