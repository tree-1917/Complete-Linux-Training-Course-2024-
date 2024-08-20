# 🐧 **Ultimate Guide to Shell Scripting**

Welcome to the ultimate guide to shell scripting! In this tutorial, you’ll learn everything from the Linux kernel basics to writing and running your own shell scripts. By the end, you’ll be able to automate tasks, manage servers, and create powerful tools using shell scripting.

---

## 📜 **Table of Contents**

1. 🧠 [Understanding the Linux Kernel](#understanding-the-linux-kernel)
2. 🐚 [What is a Shell?](#what-is-a-shell)
3. 📚 [Types of Shells](#types-of-shells)
4. ✍️ [Introduction to Shell Scripting](#introduction-to-shell-scripting)
5. 🔧 [Basic Shell Scripts](#basic-shell-scripts)
6. 📥 [Handling Input and Output](#handling-input-and-output)
7. 🛑 [Using Conditionals (`if-then`)](#using-conditionals-if-then)
8. 🔁 [Looping in Shell Scripts](#looping-in-shell-scripts)
9. 🎯 [Using Case Statements](#using-case-statements)
10. 🌐 [Checking Remote Server Connectivity](#checking-remote-server-connectivity)
11. 🗂️ [Using Aliases](#using-aliases)
12. 👥 [User and Global Aliases](#user-and-global-aliases)
13. 📜 [Managing Shell History](#managing-shell-history)

---

## 1️⃣ 🧠 **Understanding the Linux Kernel**

Before diving into shell scripting, it’s essential to understand the role of the Linux kernel.

### 🔍 What is the Kernel?

The kernel is the core of an operating system, managing system resources, hardware, and enabling communication between software and hardware.

### 📜 A Brief History of the Linux Kernel

The Linux kernel was created by Linus Torvalds in 1991. Initially, it was a personal project but quickly became the foundation of various open-source operating systems.

---

## 2️⃣ 🐚 **What is a Shell?**

### 💡 What is a Shell?

A shell is a command-line interface that allows users to interact with the operating system. It bridges the gap between the user and the kernel, enabling commands and scripts to be executed.

### 🔍 How to Find Your Shell

You can check your current shell with:

```sh
echo $0
```

To list available shells on your system:

```sh
cat /etc/shells
```

To see your assigned shell:

```sh
grep $(whoami) /etc/passwd
```

---

## 3️⃣ 📚 **Types of Shells**

Different shells offer various features. Some common types include:

- **🐚 `sh`**: Bourne Shell – basic Unix shell.
- **🐚 `bash`**: Bourne Again Shell – advanced features and scripts.
- **🔠 `csh`**: C Shell – C-like syntax.
- **🔠 `tcsh`**: Enhanced C Shell.
- **🐚 `ksh`**: Korn Shell – powerful scripting and command features.

### 🆚 Comparing Shells

| Feature            | `sh`  | `bash`        | `csh`         | `tcsh`         | `ksh`         |
| ------------------ | ----- | ------------- | ------------- | -------------- | ------------- |
| Command Syntax     | Basic | Extended      | C-like        | Enhanced `csh` | Advanced      |
| Scripting Features | Basic | Advanced      | Limited       | Advanced       | Advanced      |
| Interactive Use    | Basic | User-friendly | User-friendly | User-friendly  | User-friendly |

---

## 4️⃣ ✍️ **Introduction to Shell Scripting**

### 📝 What is Shell Scripting?

Shell scripting involves writing scripts to automate tasks in a shell environment. Shell scripts can perform operations like file management, system monitoring, and scheduled tasks.

### 🛠️ Tips for Writing Shell Scripts

- **💬 Use Comments**: Annotate your scripts for clarity.
- **❗ Handle Errors**: Implement error handling to catch issues.
- **📝 Use Meaningful Variable Names**: Keep scripts readable.
- **🔑 Script Permissions**: Ensure your script is executable.
- **🔄 Portability**: Write scripts that can run across different environments.

---

## 5️⃣ 🔧 **Basic Shell Scripts**

Let’s start with some basic examples.

### **👋 Hello World Script**

This simple script prints "Hello, World!" to the terminal.

```sh
#!/bin/bash
# 👋 Simple Hello World Script
echo "Hello, World! 🌍"
```

### **💾 File Backup Script**

This script backs up a file to a specified location.

```sh
#!/bin/bash
# 💾 File Backup Script
ORIGINAL_FILE="/path/to/original_file"
BACKUP_LOCATION="/path/to/backup_location"
cp "$ORIGINAL_FILE" "$BACKUP_LOCATION"
echo "Backup completed successfully! ✅"
```

### **📊 Disk Usage Report Script**

This script generates a disk usage report and saves it to a file.

```sh
#!/bin/bash
# 📊 Disk Usage Report Script
OUTPUT_FILE="/path/to/disk_usage_report.txt"
df -h > "$OUTPUT_FILE"
echo "Disk usage report generated and saved to $OUTPUT_FILE 📁"
```

---

## 6️⃣ 📥 **Handling Input and Output**

### **🎤 User Input Script**

This script asks the user for their name and greets them.

```sh
#!/bin/bash
# 🎤 User Input Script
echo "What's your name? 🤔"
read USER_NAME
echo "Hello, $USER_NAME! 👋"
```

---

## 7️⃣ 🛑 **Using Conditionals (`if-then`)**

### **🛑 if-then Script**

This script checks if a directory exists and prints a message.

```sh
#!/bin/bash
# 🛑 if-then Script: Check if a directory exists
DIRECTORY="/path/to/directory"

if [ -d "$DIRECTORY" ]; then
  echo "The directory $DIRECTORY exists ✅"
else
  echo "The directory $DIRECTORY does NOT exist ❌"
fi
```

---

## 8️⃣ 🔁 **Looping in Shell Scripts**

### **🔄 for Loop Script**

This script lists all files in a directory.

```sh
#!/bin/bash
# 🔄 for Loop Script: List all files in a directory
for FILE in /path/to/directory/*; do
  echo "Found file: $FILE 📄"
done
```

### **🔄 while Loop Script**

This script counts down from 5 to 1.

```sh
#!/bin/bash
# 🔄 while Loop Script: Countdown from 5 to 1
COUNT=5

while [ $COUNT -gt 0 ]; do
  echo "Countdown: $COUNT ⏳"
  ((COUNT--))
done

echo "Blast off! 🚀"
```

---

## 9️⃣ 🎯 **Using Case Statements**

### **🎯 Case Statement Script**

This script asks the user to choose a fruit and responds based on their choice.

```sh
#!/bin/bash
# 🎯 Case Statement Script: Choose a fruit

echo "Pick a fruit: 🍎 Apple, 🍌 Banana, 🍇 Grape"
read FRUIT

case $FRUIT in
  "Apple")
    echo "You picked an Apple! 🍏"
    ;;
  "Banana")
    echo "You picked a Banana! 🍌"
    ;;
  "Grape")
    echo "You picked a Grape! 🍇"
    ;;
  *)
    echo "Unknown choice. Please pick a valid fruit. ❓"
    ;;
esac
```

---

## 🔟 🌐 **Checking Remote Server Connectivity**

This script checks if a remote server is reachable using `ping`.

```sh
#!/bin/bash
# 🌐 Check Remote Server Connectivity Script

SERVER="example.com"

if ping -c 1 "$SERVER" &> /dev/null; then
  echo "The server $SERVER is reachable! 🌍"
else
  echo "The server $SERVER is NOT reachable! 🚫"
fi
```

---

## 1️⃣1️⃣ 🗂️ **Using Aliases**

### **🗂️ Creating an Alias Script**

This script sets up a quick alias for listing files.

```sh
#!/bin/bash
# 🗂️ Creating an Alias Script

alias ll="ls -l --color=auto"
echo "Alias 'll' for 'ls -l --color=auto' created! 🚀"
```

---

## 1️⃣2️⃣ 👥 **User and Global Aliases**

Aliases can be user-specific or global. Add user-specific aliases in `~/.bashrc` and global aliases in `/etc/bash.bashrc`.

```sh
# Add to ~/.bashrc (user-specific)
alias gs="git status"

# Add to /etc/bash.bashrc (global)
alias update="sudo apt update && sudo apt upgrade -y"
```

---

## 1️⃣3️⃣ 📜 **Managing Shell History**

Use the `history` command to view and manage your command history. Here’s an example of exporting your history to a file.

```sh
#!/bin/bash
# 📜 Export Shell History

history > ~/shell_history.txt
echo "Shell history exported to ~/shell_history.txt 📁"
```

---
