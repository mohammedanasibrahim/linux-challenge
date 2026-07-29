# Linux Challenge 

Solutions to the Linux Challenge, covering Linux fundamentals, system administration, process management, networking, and shell scripting automation.

## What this covers

**Beginner**
- Directory structure creation and navigation
- File creation, permissions (`chmod`), and ownership
- User and group management (`useradd`, `groupadd`, `usermod`)
- Disk usage reporting with `du`

**Intermediate**
- Process management (`ps`, background jobs, `kill`)
- CPU/memory monitoring with `top`
- Network configuration checks (`ip addr`), connectivity testing (`ping`), open ports (`netstat`)
- Firewall setup with `ufw`

**Shell scripting**
- `scripts/backup.sh` — compresses the project directory into a `tar.gz` archive, with error handling if the source directory is missing
- `scripts/cleanup.sh` — deletes backup files older than 7 days, scheduled daily via `cron`
- `scripts/rotate_logs.sh` — rotates a log file once it exceeds 1MB, appending a timestamp to the archived copy
- `scripts/background-process.sh` — logs the current date and time every 60 seconds using a `while` loop

**Advanced**
- `scripts/resource_monitor.sh` — reports CPU, memory, and disk usage, intended to run on a cron schedule and log to `resource_usage.log`
- `scripts/email_alert.sh` — sends an email alert if CPU usage exceeds 80% or free disk space drops below 20%
- `scripts/bulk_user_add.sh` — bulk-creates users from `user_list.txt`, assigns them to a group, sets a default password, and creates home directories

## Usage

Each script is standalone. Give it execute permission and run it:

chmod +x scripts/backup.sh

./scripts/backup.sh

`email_alert.sh` requires a working local `mail` command (e.g. `mailutils`) and the `EMAIL` variable set to a real address before use.

## Note

Passwords and email addresses in these scripts are placeholders — replace them with your own before running in a real environment.
