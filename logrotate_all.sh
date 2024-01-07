#!/usr/bin/env bash
#
# Log Rotation Script
# Author: Aboulkacem KRADRA (@kacemsys)
#
# Description:
#   This script rotates and compresses old log files in the /var/log directory using
#   the logrotate utility. It rotates logs daily and keeps 4 weeks worth, providing
#   debug and verbose output during the rotation process.
#

# Rotate and compress old log files in /var/log
for f in /var/log/*.log; do
  # Rotate logs daily, keep 4 weeks worth (with debug and verbose output)
  logrotate -d -v -f /etc/logrotate.conf "$f"
done

# Inform the user that log files have been rotated and compressed
echo "Log files rotated and compressed!"
