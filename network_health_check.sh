#!/bin/bash

echo "Please wait..."

# Test connectivity to a specific host (example Google's DNS: 8.8.8.8)
ping -c 4 8.8.8.8 > /dev/null
con_status=$?

# Display summary of network status
echo -e "\nNetwork and Security Information: $(date '+%Y-%m-%d %H:%M:%S')"
echo "- Connectivity: $(if [[ $con_status -eq 0 ]]; then echo "Successful"; else echo "Failed"; fi)"
echo "- Interfaces: $(ip link | grep UP | awk '{print $2}' | paste -sd ', ' -)"
echo "- IP Addresses: $(ip addr show | awk '/inet/ {print $2}' | cut -d/ -f1 | paste -sd ', ' -)"
echo "- Default Gateway: $(ip route | awk '/default/ {print $3}')"
echo "- External IP Address: $(curl -s ifconfig.me)"
echo "- Public DNS Servers: $(nslookup -type=NS google.com | awk '/Server:/ {print $2}')"

# Network and Security Information
echo "- Firewall Status: $(systemctl is-active firewalld)"
echo "- Active Users: $(who)"
echo "- Open Ports: $(netstat -tunlp | awk '/LISTEN/ {gsub(/.*:/, "", $4); print $4}' | tr '\n' ', ')"
echo "- OpenSSH Version: $(ssh -V 2>&1 | cut -d' ' -f1-2)"
echo "- Heartbleed vulnerability (OpenSSL): $(openssl version -a | grep -q 'OpenSSL 1.0.1[0-9a-f]*' && echo "Vulnerable, Update OpenSSL!" || echo "Not Vulnerable")"
echo "- Shellshock vulnerability (Bash): $(env 'VAR=() { :;}; echo vulnerable' 'FUNCTION()=() { :;}; echo Vulnerable' bash -c 'echo Not Vulnerable')"
echo 
echo "- Listening Services:" 
echo "$(ss -tunlp | awk '/LISTEN/ {print "Service:", $7, "| Protocol:", $1, "| User:", $NF}' | column -t)"
echo

echo  "- ARP Table :"
echo "$(arp -a)"
echo 
echo "- Active Connections:"
echo "$(netstat -tunapl | grep ESTABLISHED)"
