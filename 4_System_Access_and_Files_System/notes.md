# System Access and File Systems

> Outline :

- [ ]
- [ ]

---

## Content

### 38. Important Things to Remember in Linux

- How is Super-user account called Root ?
- What mean Linux Case-sensitive system ?
- What is Linux Kernel ?
- Linux is Cli or GUI ?

### 39. Access to Linux System

- How To Access To Linux System
  - Console (VGA,HDMI,DVI)
  - Remote
    - RDP (windos)
    - sharing (mac)
    - Putty (linux)
    - SSH built-in client

### 41. Access Linux via Putty or SSH command line

- How to Access To Linux System :
  - Putty ?
  - SSH ?

### 42. Command Prompts and Getting Prompts Back

- What are Command Prompts ?

### 43. Introduction to Linux File System

- What is a Filesystem ?
  - Make an example : Linux File System
    - everything start from `\`
  - Make an example : windows file System
    - everything start from `c:`
- What is differnt types of filesystem :
  - ext3, ext4, btrfs, ntfs ...

### 44. FileSystem Structure and Description

- make a list for all linux file system structure :
  - /boot : boot loader
  - /root : It is not same as /
  - /dev : System devices
  - /etc : configuration files **et cetera**
  - /bin : user commands
  - /sbin : System Commands
  - /opt : Optional add-on applications (no part os apps)
  - /proc : Running processes (only exist in Momory)
  - /lib : C programming libaray file needed by commands and apps `strace -e open pwd`
  - /tmp : temporay files
  - /home : Directory for user
  - /var : system logs
  - /run : runtime
  - /mnt : to mount external filesystem
  - /media : cdrom mounts

### 45. File System Navigation Commands (cd , ls and pwd)

- How to Navigating File System ?
  - make a talbe for common commands use for navigating on table .

### 46. Linux File or Directory Properties

- What are Linux file and Directory Properties ?
- what is hard links and How calculate the number of it ?

### 47. Linux File Types

- What is linux file tyeps ?
  - Make a table for all file types in linux and meaning of each one 7 file types

### 48. What is root?

- What is Root ?
  - Root account
  - Root as /
  - Root home directory (/root)

### 49. Changing Password

- How to change a password
  - Command = `passwd userid`

### 50. Absolute and Relative Paths

- Talk about File System Paths
  - Absolute Path
  - Relative Path

### 51. Creating Files and Directories (touch, cp, vi, mkdir)

- How to use touch , cp , vi and mkdir ?
  - make a case to use eachone

### 52. Copying directories

- How to copy Directories ?
  - cp -r <source> <destination>

### 53. Finding Files and Directories (find, locate)

- How to search in Linux ?
- Make a comapre between **`find` vs `locate`**
- 