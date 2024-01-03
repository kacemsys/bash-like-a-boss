#!/usr/bin/env bash

# Allow SSH access from specific IP addresses
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
firewall-cmd --reload

echo "Firewall configured for SSH access from your network!"

