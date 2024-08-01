Sure! Here’s a revised outline with updated lesson content following the table of contents:

---

# System Administration Lessons

## Table of Contents

1. **[87. Linux File Editor (vi) ✏️](#linux-file-editor-vi)**
2. **[88. Difference between vi and vim Editors 🔄](#difference-between-vi-and-vim-editors)**
3. **[89. "sed" Command 🛠️](#sed-command)**
4. **[90. User Account Management (useradd, groupadd, usermod, userdel, groupdel) 👥](#user-account-management)**
5. **[91. Enable Password Aging ⏳](#enable-password-aging)**
6. **[92. Switch Users and sudo Access (su, sudo) 🔑](#switch-users-and-sudo-access)**
7. **[93. Monitor Users (who, last, w, id) 👀](#monitor-users)**
8. **[94. Talking to Users (users, wall, write) 🗣️](#talking-to-users)**
9. **[95. Linux Directory Service - Account Authentication 📂](#linux-directory-service-account-authentication)**
10. **[96. Difference between Active Directory, LDAP, IDM, WinBIND, OpenLDAP 🔍](#difference-between-active-directory-ldap-idm-winbind-openldap)**
11. **[97. System Utility Commands (date, uptime, hostname, uname, which, cal, bc) ⏱️](#system-utility-commands)**
12. **[98. Processes, Jobs and Scheduling ⚙️](#processes-jobs-and-scheduling)**
13. **[99. systemctl Command 🔧](#systemctl-command)**
14. **[100. ps Command 📋](#ps-command)**
15. **[101. top Command 📊](#top-command)**
16. **[102. kill Command 🚫](#kill-command)**
17. **[103. crontab Command 🕒](#crontab-command)**
18. **[104. at Command ⏲️](#at-command)**
19. **[105. Additional Cronjobs (hourly, daily, weekly, monthly) 📅](#additional-cronjobs)**
20. **[106. Process Management (bg, fg, nice) ⚖️](#process-management)**
21. **[107. System Monitoring Commands (df, dmesg, iostat, netstat, free, top) 📈](#system-monitoring-commands)**
22. **[108. System Logs Monitor (/var/log) 📜](#system-logs-monitor)**
23. **[109. System Maintenance Commands (shutdown, init, reboot, halt) 🛠️](#system-maintenance-commands)**
24. **[110. Changing System Hostname (hostnamectl) 🏷️](#changing-system-hostname)**
25. **[111. Finding System Information (uname, dmidecode) 🔍](#finding-system-information)**
26. **[112. Finding System Architecture (arch) 🖥️](#finding-system-architecture)**
27. **[113. Terminal Control Keys ⌨️](#terminal-control-keys)**
28. **[114. Terminal Commands (clear, exit, script) 💻](#terminal-commands)**
29. **[115. Recover Root Password 🔑](#recover-root-password)**
30. **[116. SOS Report 🆘](#sos-report)**
31. **[117. Environment Variables 🌍](#environment-variables)**
32. **[118. Special Permissions with setuid, setgid, and sticky bit 🔒](#special-permissions-with-setuid-setgid-and-sticky-bit)**

---

## 87. Linux File Editor (vi) ✏️

**What is `Vi`?**

- `Vi` is a classic text editor in Unix-based systems used for editing files.

**Common Commands with `vi`:**

| Command | Description         |
| ------- | ------------------- |
| `i`     | Enter insert mode   |
| `Esc`   | Exit insert mode    |
| `:w`    | Save changes        |
| `:q`    | Quit                |
| `:wq`   | Save and quit       |
| `:q!`   | Quit without saving |
| `dd`    | Delete a line       |
| `yy`    | Copy a line         |
| `p`     | Paste               |

---

## 88. Difference between vi and vim Editors 🔄

| Feature       | `vi`    | `vim` (Vi IMproved)     |
| ------------- | ------- | ----------------------- |
| Highlighting  | No      | Yes                     |
| Undo/Redo     | Limited | Multiple undos/redos    |
| Plugins       | No      | Yes                     |
| Search        | Basic   | Advanced search         |
| Configuration | Minimal | Extensive configuration |

---

## 89. "sed" Command 🛠️

**What is `sed`?**

- `sed` stands for stream editor, used for parsing and transforming text in a pipeline.

**Common `sed` Commands:**

| Command                 | Description                        |
| ----------------------- | ---------------------------------- |
| `sed 's/old/new/' file` | Replace `old` with `new` in `file` |
| `sed -n 'p' file`       | Print lines from `file`            |
| `sed '2d' file`         | Delete the second line of `file`   |

**Examples:**

1. `sed 's/foo/bar/' file.txt` - Replace the first occurrence of "foo" with "bar" in `file.txt`.
2. `sed -n '1,3p' file.txt` - Print lines 1 through 3 from `file.txt`.
3. `sed 's/^/prefix_/' file.txt` - Add "prefix\_" to the beginning of each line in `file.txt`.

---

## 90. User Account Management (useradd, groupadd, usermod, userdel, groupdel) 👥

**Overview:**

- Commands used to manage user accounts and groups on a Linux system.

**Affected Files:**

- `/etc/passwd`
- `/etc/group`
- `/etc/shadow`

**Table of Commands with Common Options:**

| Command    | Option | Description           |
| ---------- | ------ | --------------------- |
| `useradd`  | `-m`   | Create home directory |
| `groupadd` | `-g`   | Specify group ID      |
| `usermod`  | `-aG`  | Add user to group     |
| `userdel`  | `-r`   | Remove home directory |
| `groupdel` |        | Delete a group        |

**Examples:**

1. `useradd -m newuser` - Create a new user with a home directory.
2. `groupadd developers` - Create a new group named `developers`.
3. `usermod -aG developers newuser` - Add `newuser` to the `developers` group.
4. `userdel -r olduser` - Delete user `olduser` and their home directory.
5. `groupdel oldgroup` - Delete the group `oldgroup`.

---

## 91. Enable Password Aging ⏳

**What is Password Aging?**

- Password aging refers to policies that enforce changing passwords regularly.

**Common Options for Password Aging:**

| Option | Description                            |
| ------ | -------------------------------------- |
| `-m`   | Minimum number of days between changes |
| `-M`   | Maximum number of days before change   |
| `-W`   | Warn before password expires           |
| `-I`   | Disable account after expiration       |

**Examples:**

1. `chage -m 7 -M 90 -W 7 username` - Set password aging to a minimum of 7 days, maximum of 90 days, and warn 7 days before expiration.
2. `chage -I 30 username` - Lock the account if the password has not been changed for 30 days.
3. `chage -l username` - List the password aging information for `username`.

---

## 92. Switch Users and sudo Access (su, sudo) 🔑

**What are `su` and `sudo`?**

- `su` (substitute user) allows switching to another user.
- `sudo` allows executing commands as another user, usually root.

**Common Options:**

| Command | Option | Description                       |
| ------- | ------ | --------------------------------- |
| `su`    | `-`    | Switch to the user's login shell  |
| `sudo`  | `-u`   | Execute command as specified user |

**Examples:**

1. `su -` - Switch to the root user with root’s environment.
2. `sudo ls /root` - List files in the `/root` directory as root.
3. `sudo -u username command` - Execute `command` as `username`.

---

## 93. Monitor Users (who, last, w, id) 👀

**Methods for Monitoring Users:**

| Command | Description                                   |
| ------- | --------------------------------------------- |
| `who`   | Show who is logged in                         |
| `last`  | Show last login attempts                      |
| `w`     | Show who is logged in and what they are doing |
| `id`    | Show user ID and group info                   |

|

**Examples:**

1. `who` - Display a list of logged-in users.
2. `last` - Show recent logins.
3. `w` - Display who is logged in and their activity.
4. `id username` - Show user ID and group IDs for `username`.
5. `last -a` - Show login history with hostname.

---

## 94. Talking to Users (users, wall, write) 🗣️

**Methods for Talking to Users:**

| Command | Description                       |
| ------- | --------------------------------- |
| `users` | List all logged-in users          |
| `wall`  | Broadcast a message to all users  |
| `write` | Send a message to a specific user |

**Examples:**

1. `users` - Display a list of logged-in users.
2. `wall "System maintenance starts now!"` - Send a broadcast message to all users.
3. `write username` - Start a conversation with `username`.

---

## 95. Linux Directory Service - Account Authentication 📂

**What is Account Authentication?**

- Mechanism for verifying user identities.

**Common Commands:**

| Command           | Description                                                 |
| ----------------- | ----------------------------------------------------------- |
| `authconfig`      | Configure authentication methods                            |
| `pam-auth-update` | Update PAM (Pluggable Authentication Modules) configuration |

**Examples:**

1. `authconfig --enableshadow --update` - Enable shadow passwords.
2. `pam-auth-update` - Update PAM configuration.
3. `authconfig --enablemd5 --update` - Enable MD5 password hashing.

**LDAP (Lightweight Directory Access Protocol):**

- Protocol used to access and maintain distributed directory information services.

---

## 96. Difference between Active Directory, LDAP, IDM, WinBIND, OpenLDAP 🔍

**Directory Services Comparison:**

| Service                       | Description                                               |
| ----------------------------- | --------------------------------------------------------- |
| **Active Directory**          | Microsoft's directory service for Windows environments    |
| **LDAP**                      | Protocol used for directory services, e.g., OpenLDAP      |
| **IDM (Identity Management)** | Broad term for systems managing user identities           |
| **WinBIND**                   | Component of Samba providing Active Directory integration |
| **OpenLDAP**                  | Open-source implementation of LDAP                        |

---

## 97. System Utility Commands (date, uptime, hostname, uname, which, cal, bc) ⏱️

**Overview:**

- Commands for various system information and utilities.

**Table of Commands:**

| Command    | Description                               |
| ---------- | ----------------------------------------- |
| `date`     | Display or set the system date and time   |
| `uptime`   | Show how long the system has been running |
| `hostname` | Display or set the system hostname        |
| `uname`    | Show system information                   |
| `which`    | Locate a command                          |
| `cal`      | Display a calendar                        |
| `bc`       | Command-line calculator                   |

**Examples:**

1. `date` - Display the current date and time.
2. `uptime` - Show how long the system has been running.
3. `hostname` - Display the system's hostname.
4. `uname -a` - Show detailed system information.
5. `which ls` - Find the location of the `ls` command.

---

## 98. Processes, Jobs and Scheduling ⚙️

**Linux Terminology:**

| Term            | Description                             |
| --------------- | --------------------------------------- |
| **Application** | A program or service                    |
| **Script**      | A file containing commands to execute   |
| **Process**     | An instance of a running program        |
| **Daemon**      | A background service or process         |
| **Thread**      | A single path of execution in a process |
| **Job**         | A process started by the shell          |

**Commands:**

- **Process/Service Management:** `systemctl`, `service`
- **Process Viewing:** `ps`, `top`
- **Process Termination:** `kill`
- **Scheduling:** `crontab`, `at`

---

## 99. systemctl Command 🔧

**What is `systemctl`?**

- Command to manage systemd services and units.

**Table of Common Options:**

| Command     | Option    | Description              |
| ----------- | --------- | ------------------------ |
| `systemctl` | `start`   | Start a service          |
| `systemctl` | `stop`    | Stop a service           |
| `systemctl` | `status`  | Show service status      |
| `systemctl` | `restart` | Restart a service        |
| `systemctl` | `enable`  | Enable a service at boot |

**Examples:**

1. `systemctl start nginx` - Start the `nginx` service.
2. `systemctl stop apache2` - Stop the `apache2` service.
3. `systemctl status sshd` - Check the status of the `sshd` service.

---

## 100. ps Command 📋

**What is `ps`?**

- Command to display information about active processes.

**Table of Common Options:**

| Command | Option | Description               |
| ------- | ------ | ------------------------- |
| `ps`    | `-e`   | Show all processes        |
| `ps`    | `-f`   | Full format listing       |
| `ps`    | `-u`   | Show processes for a user |

**Examples:**

1. `ps -e` - List all processes running on the system.
2. `ps -f` - Display a full format listing of processes.
3. `ps -u username` - Show processes for the specified user.

---

## 101. top Command 📊

**What is `top`?**

- Command to display real-time system information and process management.

**Table of Common Options:**

| Command | Option | Description                   |
| ------- | ------ | ----------------------------- |
| `top`   | `-d`   | Set the delay between updates |
| `top`   | `-p`   | Monitor specific process IDs  |
| `top`   | `-u`   | Show processes for a user     |

**Examples:**

1. `top` - Display a real-time view of system processes.
2. `top -d 5` - Update every 5 seconds.
3. `top -p 1234` - Monitor process with ID 1234.

---

## 102. kill Command 🚫

**What are `kill`, `killall`, and `pkill`?**

- Commands to terminate processes.

**Table of Common Options:**

| Command   | Option | Description                    |
| --------- | ------ | ------------------------------ |
| `kill`    | `-9`   | Force kill a process           |
| `killall` | `-9`   | Kill all processes with name   |
| `pkill`   | `-f`   | Kill processes by name pattern |

**Examples:**

1. `kill -9 1234` - Force kill process with ID 1234.
2. `killall -9 firefox` - Kill all `firefox` processes.
3. `pkill -f 'my_script.sh'` - Kill processes matching 'my_script.sh'.

---

## 103. crontab Command 🕒

**What is `crontab`?**

- Command to manage cron jobs for scheduling tasks.

**Table of Common Options:**

| Command   | Option | Description          |
| --------- | ------ | -------------------- |
| `crontab` | `-e`   | Edit crontab file    |
| `crontab` | `-l`   | List crontab entries |
| `crontab` | `-r`   | Remove crontab file  |

**Examples:**

1. `crontab -e` - Edit the crontab file.
2. `crontab -l` - List scheduled cron jobs.
3. `crontab -r` - Remove the crontab file.

---

## 104. at Command ⏲️

**What is `at`?**

- Command to schedule tasks to run once at a specified time.

**Table of Common Options:**

| Command | Option  | Description                       |
| ------- | ------- | --------------------------------- |
| `at`    | `now`   | Run command immediately           |
| `at`    | `HH:MM` | Schedule command at specific time |
| `atq`   |         | List scheduled `at` jobs          |
| `atrm`  |         | Remove scheduled `at` jobs        |

**Examples:**

1. `echo "backup.sh" | at now + 1 minute` - Run `backup.sh` in 1 minute.
2. `at 14:00` - Schedule a command at 2 PM.
3. `atq` - List all scheduled `at` jobs.

---

## 105. Additional Cronjobs (hourly, daily, weekly, monthly) 📅

**What are Cronjobs?**

- Scheduled tasks that run automatically at specified intervals.

**Common Cronjob Options:**

| Interval | File Location        | Description     |
| -------- | -------------------- | --------------- |
| Hourly   | `/etc/cron.hourly/`  | Run every hour  |
| Daily    | `/etc/cron.daily/`   | Run every day   |
| Weekly   | `/etc/cron.weekly/`  | Run every week  |
| Monthly  | `/etc/cron.monthly/` | Run every month |

\*\*Examples

:\*\*

1. Place a script in `/etc/cron.hourly/` to run every hour.
2. Place a script in `/etc/cron.daily/` to run every day.
3. Place a script in `/etc/cron.monthly/` to run every month.

---

## 106. Process Management (bg, fg, nice) ⚖️

**What is Process Management?**

- Techniques and commands for managing processes and jobs.

**Common Options:**

| Command | Option | Description                              |
| ------- | ------ | ---------------------------------------- |
| `bg`    |        | Resume a suspended job in background     |
| `fg`    |        | Bring a background job to the foreground |
| `nice`  | `-n`   | Set the priority of a process            |

**Examples:**

1. `bg %1` - Resume job 1 in the background.
2. `fg %1` - Bring job 1 to the foreground.
3. `nice -n 10 command` - Run `command` with a priority of 10.

---

## 107. System Monitoring Commands (df, dmesg, iostat, netstat, free, top) 📈

**What is System Monitoring?**

- Commands to check system performance and status.

**Table of Common Options:**

| Command   | Option  | Description                                  |
| --------- | ------- | -------------------------------------------- |
| `df`      | `-h`    | Show disk space in human-readable format     |
| `dmesg`   |         | Show kernel ring buffer messages             |
| `iostat`  | `1`     | Report statistics every second               |
| `netstat` | `-tuln` | Show network connections and listening ports |
| `free`    | `-m`    | Display memory usage in MB                   |
| `top`     |         | Show real-time process and system status     |

**Examples:**

1. `df -h` - Display disk usage in human-readable format.
2. `dmesg | less` - View kernel messages.
3. `iostat 1` - Show I/O statistics every second.
4. `netstat -tuln` - Show active network connections.
5. `free -m` - Display memory usage in megabytes.

---

## 108. System Logs Monitor (/var/log) 📜

**What is System Logs Monitor?**

- Commands to view and analyze system logs.

**Common Log Files:**

| File                | Description                   |
| ------------------- | ----------------------------- |
| `/var/log/syslog`   | General system logs           |
| `/var/log/auth.log` | Authentication logs           |
| `/var/log/kern.log` | Kernel logs                   |
| `/var/log/dmesg`    | Boot and kernel messages      |
| `/var/log/messages` | Miscellaneous system messages |

**Examples:**

1. `tail -f /var/log/syslog` - Continuously view system log updates.
2. `grep 'error' /var/log/auth.log` - Search for errors in authentication logs.
3. `less /var/log/kern.log` - View kernel logs.

---

## 109. System Maintenance Commands (shutdown, init, reboot, halt) 🛠️

**What is System Maintenance?**

- Commands for managing system power and state.

**Table of Common Options:**

| Command    | Option | Description                            |
| ---------- | ------ | -------------------------------------- |
| `shutdown` | `-h`   | Halt or power off the system           |
| `init`     | `6`    | Reboot the system                      |
| `reboot`   |        | Reboot the system                      |
| `halt`     |        | Stop all processes and halt the system |

**Examples:**

1. `shutdown -h now` - Immediately power off the system.
2. `init 6` - Reboot the system.
3. `reboot` - Reboot the system.

---

## 110. Changing System Hostname (hostnamectl) 🏷️

**What is Changing System Hostname?**

- Commands to set or change the system hostname.

**Table of Common Options:**

| Command       | Option         | Description              |
| ------------- | -------------- | ------------------------ |
| `hostnamectl` | `set-hostname` | Set a new hostname       |
| `hostnamectl` | `status`       | Display current hostname |

**Examples:**

1. `hostnamectl set-hostname new-hostname` - Change the system hostname.
2. `hostnamectl status` - Display the current hostname.
3. `hostnamectl set-hostname --static new-static-hostname` - Set the static hostname.

---

## 111. Finding System Information (uname, dmidecode) 🔍

**What are Commands for Finding System Information?**

- Commands to retrieve information about the system hardware and software.

**Table of Common Options:**

| Command     | Option | Description                           |
| ----------- | ------ | ------------------------------------- |
| `uname`     | `-a`   | Display all system information        |
| `dmidecode` | `-t`   | Display specific hardware information |

**Examples:**

1. `uname -a` - Show detailed system information.
2. `dmidecode -t memory` - Display information about system memory.
3. `dmidecode -t processor` - Show processor details.

---

## 112. Finding System Architecture (arch) 🖥️

**What is System Architecture?**

- The design and structure of a computer system's hardware.

**32-bit vs 64-bit CPU:**

| Feature       | 32-bit              | 64-bit                      |
| ------------- | ------------------- | --------------------------- |
| Addressing    | Limited to 4 GB RAM | Supports more than 4 GB RAM |
| Performance   | Slower              | Faster                      |
| Compatibility | Older software      | Modern software and OS      |

**Examples:**

1. `arch` - Display the system architecture.
2. `uname -m` - Show machine hardware name.
3. `lscpu` - Display CPU architecture information.

---

## 113. Terminal Control Keys ⌨️

**What are Terminal Control Keys?**

- Keys used for controlling terminal behavior.

**Common Terminal Control Keys:**

| Key      | Function                  |
| -------- | ------------------------- |
| `Ctrl+C` | Interrupt current process |
| `Ctrl+Z` | Suspend current process   |
| `Ctrl+D` | Logout or end input       |

**Examples:**

1. `Ctrl+C` - Stop a running command.
2. `Ctrl+Z` - Suspend a process and send it to the background.
3. `Ctrl+D` - Logout from the terminal or end input in a shell.

---

## 114. Terminal Commands (clear, exit, script) 💻

**What are Terminal Commands?**

- Commands used to interact with the terminal.

**Common Terminal Commands:**

| Command  | Description                       |
| -------- | --------------------------------- |
| `clear`  | Clear the terminal screen         |
| `exit`   | Exit the current shell session    |
| `script` | Record terminal session to a file |

**Examples:**

1. `clear` - Clear the terminal screen.
2. `exit` - Close the current terminal session.
3. `script session.log` - Start recording the terminal session to `session.log`.

---

## 115. Recover Root Password 🔑

**Steps to Recover Root Password:**

1. **Restart your computer.**
2. **Edit GRUB:**
   - Press `e` during boot to edit the GRUB entry.
   - Find the line starting with `linux`, append `single` or `init=/bin/bash`.
3. **Change Password:**
   - Boot into single-user mode.
   - Use `passwd root` to change the root password.
4. **Reboot:**
   - Type `reboot` to restart the system.

---

## 116. SOS Report 🆘

**What is SOS Report?**

- A tool to collect system configuration and logs for troubleshooting.

**Common Options:**

| Command     | Option | Description                       |
| ----------- | ------ | --------------------------------- |
| `sosreport` | `-o`   | Specify output directory          |
| `sosreport` | `-a`   | Include all available information |

**Examples:**

1. `sosreport` - Collect a standard report.
2. `sosreport -o /tmp/sosreport` - Save the report to `/tmp/sosreport`.
3. `sosreport -a` - Collect all available information.

---

## 117. Environment Variables 🌍

**What are Environment Variables?**

- Variables that affect the behavior of processes.

**Common Environment Variables:**

| Variable | Description                           |
| -------- | ------------------------------------- |
| `PATH`   | Directories to search for executables |
| `HOME`   | User's home directory                 |
| `SHELL`  | Path to the current shell             |

**Examples:**

1. `echo $PATH` - Display the current `PATH` variable.
2. `export VAR=value` - Set a new environment variable.
3. `printenv` - List all environment variables.

---

## 118. Special Permissions with setuid, setgid, and sticky bit 🔒

**What are Special Permissions?**

- Permissions that provide additional security controls.

**Common Special Permissions:**

| Permission   | Description                                           |
| ------------ | ----------------------------------------------------- |
| `setuid`     | Execute a file with the permissions of the file owner |
| `setgid`     | Execute a file with the permissions of the file group |
| `sticky bit` | Only the file owner can delete                        |

or rename the file |

**Examples:**

1. `chmod u+s filename` - Set the `setuid` permission.
2. `chmod g+s filename` - Set the `setgid` permission.
3. `chmod +t filename` - Set the sticky bit.

---

## 119. Process Scheduling (nice, renice) ⏲️

**What is Process Scheduling?**

- Mechanisms to manage process priorities.

**Table of Commands:**

| Command  | Option | Description                            |
| -------- | ------ | -------------------------------------- |
| `nice`   | `-n`   | Set priority for a process             |
| `renice` | `-n`   | Change priority of an existing process |

**Examples:**

1. `nice -n 10 command` - Run `command` with a priority of 10.
2. `renice -n -5 -p 1234` - Change priority of process ID 1234.

---

## 120. Disk Usage (du, df) 💽

**What is Disk Usage?**

- Commands to check and manage disk space.

**Table of Commands:**

| Command | Option | Description                                 |
| ------- | ------ | ------------------------------------------- |
| `du`    | `-h`   | Display disk usage in human-readable format |
| `df`    | `-h`   | Show disk space in human-readable format    |

**Examples:**

1. `du -h /path` - Display disk usage of `/path`.
2. `df -h` - Display disk space usage.

---

## 121. File Backup and Synchronization (rsync) 🔄

**What is `rsync`?**

- Command for file synchronization and backup.

**Table of Common Options:**

| Command | Option | Description                                |
| ------- | ------ | ------------------------------------------ |
| `rsync` | `-a`   | Archive mode (preserves permissions, etc.) |
| `rsync` | `-v`   | Verbose output                             |
| `rsync` | `-z`   | Compress file data during transfer         |

**Examples:**

1. `rsync -av /source/ /destination/` - Synchronize `/source/` with `/destination/`.
2. `rsync -avz /source/ user@remote:/destination/` - Synchronize locally with a remote server.

---

## 122. File Compression and Archiving (tar, gzip, bzip2, xz) 📦

**What are Compression Tools?**

- Commands to compress and archive files.

**Table of Commands:**

| Command | Option | Description                |
| ------- | ------ | -------------------------- |
| `tar`   | `-cvf` | Create a new tar archive   |
| `gzip`  |        | Compress files using gzip  |
| `bzip2` |        | Compress files using bzip2 |
| `xz`    |        | Compress files using xz    |

**Examples:**

1. `tar -cvf archive.tar /path` - Create a tar archive of `/path`.
2. `gzip file` - Compress `file` using gzip.
3. `bzip2 file` - Compress `file` using bzip2.
4. `xz file` - Compress `file` using xz.

---

## 123. File Permissions and Ownership (chmod, chown, chgrp) 🔑

**What are File Permissions and Ownership?**

- Commands to manage file permissions and ownership.

**Table of Commands:**

| Command | Option       | Description                         |
| ------- | ------------ | ----------------------------------- |
| `chmod` | `u+x`        | Add execute permission for the user |
| `chown` | `user:group` | Change file owner and group         |
| `chgrp` | `group`      | Change file group ownership         |

**Examples:**

1. `chmod 755 file` - Set file permissions to `755`.
2. `chown user:group file` - Change owner and group of `file`.
3. `chgrp group file` - Change group of `file`.

---

## 124. Network Configuration (ifconfig, ip, netstat) 🌐

**What is Network Configuration?**

- Commands to configure and manage network settings.

**Table of Commands:**

| Command    | Option | Description                     |
| ---------- | ------ | ------------------------------- |
| `ifconfig` | `up`   | Activate a network interface    |
| `ip`       | `addr` | Show or manipulate IP addresses |
| `netstat`  | `-r`   | Show network routing table      |

**Examples:**

1. `ifconfig eth0 up` - Activate network interface `eth0`.
2. `ip addr show` - Display IP addresses.
3. `netstat -r` - Show the routing table.

---

## 125. Network Services (ss, nmap) 🌐

**What are Network Services?**

- Commands to check and scan network services.

**Table of Commands:**

| Command | Option  | Description                    |
| ------- | ------- | ------------------------------ |
| `ss`    | `-tuln` | Show listening network sockets |
| `nmap`  | `-sT`   | Perform a TCP connect scan     |

**Examples:**

1. `ss -tuln` - Show all listening network sockets.
2. `nmap -sT 192.168.1.1` - Scan TCP ports on `192.168.1.1`.

---

## 126. User and Group Management (useradd, usermod, groupadd) 👥

**What is User and Group Management?**

- Commands to manage system users and groups.

**Table of Commands:**

| Command    | Option | Description                           |
| ---------- | ------ | ------------------------------------- |
| `useradd`  | `-m`   | Create a new user with home directory |
| `usermod`  | `-aG`  | Add user to a group                   |
| `groupadd` |        | Create a new group                    |

**Examples:**

1. `useradd -m username` - Add a new user with a home directory.
2. `usermod -aG groupname username` - Add `username` to `groupname`.
3. `groupadd groupname` - Create a new group named `groupname`.

---

## 127. Software Package Management (apt, yum, dnf) 📦

**What is Software Package Management?**

- Commands to install, update, and remove software packages.

**Table of Commands:**

| Command | Option    | Description       |
| ------- | --------- | ----------------- |
| `apt`   | `install` | Install a package |
| `yum`   | `install` | Install a package |
| `dnf`   | `install` | Install a package |

**Examples:**

1. `apt install package` - Install `package` using `apt`.
2. `yum install package` - Install `package` using `yum`.
3. `dnf install package` - Install `package` using `dnf`.

---

## 128. System Updates and Upgrades (apt, yum, dnf) 🔄

**What is System Updates and Upgrades?**

- Commands to update and upgrade the system.

**Table of Commands:**

| Command | Option    | Description          |
| ------- | --------- | -------------------- |
| `apt`   | `update`  | Update package list  |
| `apt`   | `upgrade` | Upgrade all packages |
| `yum`   | `update`  | Update all packages  |
| `dnf`   | `update`  | Update all packages  |

**Examples:**

1. `apt update` - Update the package list.
2. `apt upgrade` - Upgrade installed packages.
3. `yum update` - Update all packages.
4. `dnf update` - Update all packages.

---

## 129. System Backup and Restore (rsync, tar) 📦

**What is System Backup and Restore?**

- Commands to back up and restore system data.

**Table of Commands:**

| Command | Option | Description              |
| ------- | ------ | ------------------------ |
| `rsync` | `-a`   | Archive mode for backup  |
| `tar`   | `-cvf` | Create a backup archive  |
| `tar`   | `-xvf` | Extract a backup archive |

**Examples:**

1. `rsync -a /source/ /backup/` - Backup `/source/` to `/backup/`.
2. `tar -cvf backup.tar /path` - Create a backup archive of `/path`.
3. `tar -xvf backup.tar` - Extract a backup archive.

---
