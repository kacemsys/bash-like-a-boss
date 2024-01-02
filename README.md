# bash-like-a-boss : Daily Scripts to Conquer Your Server Room

Welcome to "Bash Like a Boss," a collection of ten Red Hat-based distribution-specific scripts designed to elevate your system administration tasks. These scripts transform daily admin routines into an efficient symphony of command-line wizardry. No more tedious keystrokes or drowning in logs – channel your inner scripting wizard and reign over your server room like a Bash Baron!

> [!NOTE]
> I've crafted and thoroughly tested the scripts provided below on Red Hat-based distributions, specifically AlmaLinux. It's advisable to make minor adjustments as needed before deploying them in your specific environment.

## Usage Guide:

1. Save scripts with meaningful names (e.g., system_report.sh).
2. Grant execution permissions using chmod +x system_report.sh.
3. Effortlessly initiate execution through the command ./system_report.sh.
   
## Scripts:

## 1. Your ID Please (your_id_please.sh) !
Empower your Linux system to identify itself by providing essential system information, including the hostname, kernel version, CPU details, memory status, and available disk space.

## 2. Disk Space Guardian (disk_space_gardian.sh):
Check for mounted partitions with less than 10% free space. This script filters the output of the df -H command to display information about file system disk space usage.

##  3. Package Update Checker (package_update_maestro.sh):
Check for updates using the yum check-update command, filtering for "Important" or "Security" updates.

## 4. Log File Rotator (logrotate_all.sh):
Rotate and compress old log files in the /var/log directory using the logrotate utility.

## 5. Firewall Fighter (allow_ssh_access_to.sh) :
Configure the firewall to allow SSH access only from specific IP addresses.

## 6. Service Guardian (check_services.sh) :
Swiftly track and monitor the status of critical services for your application. Easily customize the list to include all pertinent services.

## 7. Network and Security Overview Script (network_health_check.sh) :
A comprehensive script providing an overview of the network and security status, covering connectivity, interfaces, IP addresses, default gateway, external IP address, public DNS servers, firewall status, active users, open ports, active connections, OpenSSH version, and vulnerabilities.

## 8. System Configuration Backup Script (backup_system.sh) :
Automate the process of creating a compressed backup of the /etc directory. Provides feedback on the success or failure of the backup operation, along with a list of available backups.

## 9. System Report (linux_report.sh) :
A script covering various aspects, including basic system information, service statuses, available updates, disk space, and network information. Customizable and extendable based on specific needs.

## 10.Automate Your Tasks with Ease (script_scheduler.sh):
Simplify the process of scheduling custom scripts to run automatically using the cron service. Configure cron jobs with ease using this interactive script.

>[!TIP] 
> Implement logging for scripts scheduled with cron to easily monitor their output.
>```
> Example: 0 2 * * * /path/to/script.sh >> /path/to/logfile.log 2>&1.
>```
