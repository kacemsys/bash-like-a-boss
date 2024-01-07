#!/usr/bin/env bash
#
# SSH Access Firewall Configuration Script
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   This script configures the firewall to allow SSH access only from specific IP addresses.
#   It adds a rich rule to the firewall to permit SSH connections from the IP range 192.168.1.0/24.
#   After applying the rule, the firewall is reloaded to enforce the changes.
#

# Allow SSH access from specific IP addresses
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
firewall-cmd --reload

# Inform the user that the firewall has been configured
echo "Firewall configured for SSH access from your network!"
