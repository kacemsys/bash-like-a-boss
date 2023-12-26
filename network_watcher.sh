#!/bin/bash

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

# Function to format bytes into human-readable format
format_bytes() {
  local bytes=$1
  local kib=$((bytes / 1024))
  local mib=$((kib / 1024))
  local gib=$((mib / 1024))

  if [ $gib -gt 0 ]; then
    echo "${gib} GiB"
  elif [ $mib -gt 0 ]; then
    echo "${mib} MiB"
  elif [ $kib -gt 0 ]; then
    echo "${kib} KiB"
  else
    echo "${bytes} B"
  fi
}

# Display live bandwidth usage
display_bandwidth() {
  echo -e "$(print_color 34 "Live Bandwidth Usage:")"
  while true; do
    rx_before=$(cat /sys/class/net/$(ip route | grep default | awk '{print $5}')/statistics/rx_bytes)
    tx_before=$(cat /sys/class/net/$(ip route | grep default | awk '{print $5}')/statistics/tx_bytes)
    sleep 1
    rx_after=$(cat /sys/class/net/$(ip route | grep default | awk '{print $5}')/statistics/rx_bytes)
    tx_after=$(cat /sys/class/net/$(ip route | grep default | awk '{print $5}')/statistics/tx_bytes)

    rx_speed=$((rx_after - rx_before))
    tx_speed=$((tx_after - tx_before))

    echo -e "Download: $(print_color 32 "$(format_bytes "$rx_speed")/s")   Upload: $(print_color 33 "$(format_bytes "$tx_speed")/s")"
  done
}

# Display active network connections
display_connections() {
  if command_exists "ss"; then
    echo -e "\n$(print_color 34 "Active Network Connections:")"
    ss -tuna
  elif command_exists "netstat"; then
    echo -e "\n$(print_color 34 "Active Network Connections:")"
    netstat -tuna
  else
    echo -e "\n$(print_color 31 "Error: ss or netstat command not found. Please install either of them.")"
  fi
}

# Run the network watcher
echo -e "$(print_color 34 "Network Watcher - Continuous Monitoring")"
display_bandwidth &
display_connections

# Allow the user to interrupt the script
trap 'kill $(jobs -p)' EXIT
read -rp "Press Enter to stop monitoring..."
