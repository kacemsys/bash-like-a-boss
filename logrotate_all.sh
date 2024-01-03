#!/usr/bin/env bash

# Rotate and compress old log files in /var/log
for f in /var/log/*.log; do
  # Rotate logs daily, keep 4 weeks worth (with debug and verbose output)
  logrotate -d -v -f /etc/logrotate.conf "$f"
done

echo "Log files rotated and compressed!"

