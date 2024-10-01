# 📘 **Tutorial: Disk Management**

### 📋 **Table of Contents**

- [Adding Swap Space](#adding-swap-space)
- [The xfs_info command](#the-xfs_info-command)
- [Advanced Storage Management with Straits](#advanced-storage-management-with-straits)
- [RAID](#raid)
- [File System Check (fsck and xfs_repair)](#file-system-check-fsck-and-xfs_repair)
- [System Backup (dd Command)](#system-backup-dd-command)
- [Network File System (NFS)](#network-file-system-nfs)
- [Samba Installation and Configuration](#samba-installation-and-configuration)
- [NAS Drive for NFS or Samba](#nas-drive-for-nfs-or-samba)
- [SATA and SAS](#sata-and-sas)
- [Difference Between CentOS/Redhat 5, 6 and 7](#difference-between-centosredhat-5-6-and-7)

---

### 192. Adding Swap Space

#### 🔄 **Adding Swap Space**

**Swap** is a space on a disk that is used when the amount of physical RAM memory is full. Here's how to manage it:

- **Recommended Swap Size**: Typically 1.5 to 2 times the amount of RAM.
- **Commands**:
  - **dd**: Create a swap file.
  - **mkswap**: Set up the swap area.
  - **swapon**: Activate swap.
  - **swapoff**: Deactivate swap.

#### 📝 **Script to Add Swap Space Dynamically**

Create a script to dynamically determine RAM size and set up swap accordingly:

```bash
#!/bin/bash

# Get RAM size in GB
ram_gb=$(free -g | awk '/^Mem:/{print $2}')

# Calculate swap size (recommend 2 times RAM)
swap_size=$((ram_gb * 2))

# Create swap file
sudo dd if=/dev/zero of=/swapfile bs=1G count=$swap_size

# Set up swap area
sudo mkswap /swapfile

# Activate swap
sudo swapon /swapfile

# Add swap entry to /etc/fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

### 193. The xfs_info command

#### 📊 **Understanding xfs_info**

**xfs_info** displays information about an XFS file system, including metadata and configuration details.

- **XFS File System**: High-performance file system known for scalability and reliability.

#### 📜 **Script for xfs_info**

Use cases for **xfs_info**:

```bash
#!/bin/bash

# Display basic XFS file system information
sudo xfs_info /dev/sda1

# Display detailed XFS mount options
sudo xfs_info -o all /dev/sda1
```

#### 📋 **Common Options for xfs_info**

| **Option** | **Description**                |
| ---------- | ------------------------------ |
| `-o all`   | Display all mount options      |
| `-n`       | Display node information       |
| `-f`       | Display filesystem information |

### 194. Advanced Storage Management with Straits

#### 💾 **Understanding Straits**

**Straits** is a tool for advanced storage management, offering features like volume management and snapshotting.

- **Usage**: Manage storage resources efficiently.
- **Need**: Simplifies management of large-scale storage environments.

#### 📑 **Script for Straits**

Practical script examples for **straits**:

```bash
#!/bin/bash

# Create a new storage pool
straits create pool mypool /dev/sdb

# Create a new volume
straits create volume myvolume --size 10G --pool mypool

# List all volumes and pools
straits list
```

#### 📋 **Common Options for Straits**

| **Option**      | **Description**             |
| --------------- | --------------------------- |
| `create pool`   | Create a new storage pool   |
| `create volume` | Create a new storage volume |
| `list`          | List all volumes and pools  |
| `delete volume` | Delete a storage volume     |

### 195. RAID

#### 🛡️ **Understanding RAID**

**RAID (Redundant Array of Independent Disks)** combines multiple disks into a single unit for data redundancy or performance improvement.

- **Types**:
  - **RAID0**: Striping for performance.
  - **RAID1**: Mirroring for redundancy.
  - **RAID5**: Striping with parity.

#### 📝 **Script for RAID**

Common tasks with RAID:

```bash
#!/bin/bash

# Create RAID0 array
sudo mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/sdb /dev/sdc

# Create RAID1 array
sudo mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdd /dev/sde

# Create RAID5 array
sudo mdadm --create /dev/md2 --level=5 --raid-devices=3 /dev/sdf /dev/sdg /dev/sdh
```

#### 🔄 **Use Case for RAID**

Use RAID0 for data-intensive applications, RAID1 for critical data redundancy, and RAID5 for a balance of performance and redundancy.

### 198. File System Check (fsck and xfs_repair)

#### 🔍 **Understanding fsck and xfs_repair**

**fsck** and **xfs_repair** are utilities for checking and repairing file systems.

- **fsck**: File system consistency check.
- **xfs_repair**: Repair XFS file systems.

#### 📋 **Common Usage for fsck and xfs_repair**

Basic usage examples:

```bash
# Check and repair ext4 file system
sudo fsck /dev/sda1

# Repair XFS file system
sudo xfs_repair /dev/sdb1
```

#### 📊 **Common Options for fsck and xfs_repair**

| **Option** | **Description**                                     |
| ---------- | --------------------------------------------------- |
| `-f`       | Force checking even if the file system seems clean. |
| `-y`       | Assume answer "yes" to all questions.               |

### 199. System Backup (dd Command)

#### 📦 **Understanding dd Command**

**dd** is a command-line utility for data copying and conversion.

- **Usage**: Create backups, clone drives, and manipulate data streams.

#### 📝 **Script for dd Command**

Practical script for creating system backups:

```bash
#!/bin/bash

# Backup entire disk
sudo dd if=/dev/sda of=/backup/sda_backup.img bs=4M

# Restore disk image
sudo dd if=/backup/sda_backup.img of=/dev/sda bs=4M
```

#### 📋 **Common Options for dd Command**

| **Option** | **Description**               |
| ---------- | ----------------------------- |
| `if`       | Input file.                   |
| `of`       | Output file.                  |
| `bs`       | Block size for data transfer. |

### 200. Network File System (NFS)

#### 📂 **Understanding Network File System (NFS)**

**NFS** allows remote access to files over a network, treating them as local files.

- **Usage**: Share files between systems transparently.
- **Workflow**: Client-server model for file sharing.

#### 📊 **Example and Steps for NFS**

**Example**: Sharing files between Linux systems using NFS.

**Configuration Steps for NFS Server**:

1. Install NFS packages (`sudo yum install nfs-utils`).
2. Enable and start NFS services (`sudo systemctl enable --now nfs-server.service`).
3. Create NFS directory and set permissions.
4. Edit `/etc/exports` to define shared directories.
5. Export NFS filesystem (`sudo exportfs -r`).

**Configuration Steps for NFS Client**:

1. Install NFS packages (`sudo yum install nfs-utils`).
2. Ensure NFS ports are open in firewall (`sudo firewall-cmd --add-service=nfs --permanent`).
3. Mount NFS filesystem (`sudo mount -t nfs server:/shared_dir /mnt/nfs`).
4. Verify mounted filesystem (`df -h`).
5. Unmount filesystem (`sudo umount /mnt/nfs`).

### 201. Samba Installation and Configuration

#### 🖨️ **Understanding Samba**

**Samba** allows Linux systems to share files and printers with Windows systems.

- **SMB vs CIFS**: SMB (Server Message Block) is a protocol, CIFS (Common Internet File System) is an implementation of SMB.
- **History**: Developed to provide interoperability between Windows and Linux/Unix systems.

#### 📝 **Installation and Configuration Steps for Samba**

1. Install Samba package (`sudo yum install samba`).
2. Allow Samba through firewall (`sudo firewall-cmd --add-service=samba --permanent`).
3. Create Samba share directory and set permissions.
4. Update SELinux context for Samba share (`sudo chcon -t samba_share_t /path/to/shared_dir`).
5. Edit `/etc/samba/smb.conf` to define shared directories.
6. Verify configuration (`sudo testparm`).
7. Start and enable Samba services (`sudo systemctl enable --now smb.service`).

### 202. NAS Drive for NFS or Samba

#### 📦 **Understanding NAS**

**NAS (Network Attached Storage)** is a dedicated file storage device that provides shared access to files.

- **Shared Access**: Supports NFS and Samba protocols for file sharing.
- **Physical Layout**: Typically includes multiple disks in RAID configuration for redundancy.

#### 📑 **Configuration Script for NAS with NFS and Samba**

Practical script to configure NAS for NFS and Samba sharing:

```bash
#!/bin/bash

# Install necessary packages
sudo yum install nfs-utils samba

# Configure NFS
sudo systemctl enable --now nfs-server
sudo mkdir /export/nfs_share
sudo chmod -R 777 /export/nfs_share
sudo echo "/export/nfs_share *(rw,sync,no_root_squash)" >> /etc/exports
sudo exportfs -r

# Configure Samba
sudo systemctl enable --now smb
sudo mkdir /export/samba_share
sudo chmod -R 777 /export/samba_share
sudo echo "[samba_share]" >> /etc/samba/smb.conf
sudo echo "   path = /export/samba_share" >> /etc/samba/smb.conf
sudo echo "   writable = yes" >> /etc/samba/smb.conf
sudo echo "   guest ok = yes" >> /etc/samba/smb.conf
sudo systemctl restart smb
```

#### 📋 **Mounting Shared Folder from NAS**

Mount shared folder from NAS to Linux or Windows:

- **Linux**: `sudo mount -t nfs server:/export/nfs_share /mnt/nfs`
- **Windows**: Map network drive using NAS IP and shared folder path.

### 203. SATA and SAS

#### 📟 **Understanding SATA and SAS**

**SATA (Serial ATA)** and **SAS (Serial Attached SCSI)** are interface standards for connecting storage devices.

- **Comparison**:
  - **SAS**: Faster and more reliable, often used in enterprise environments.
  - **SATA**: Cost-effective, commonly used in consumer devices.

#### 📝 **Example**

Example:

- **SATA Cable**: Used for connecting storage devices in personal computers.
- **SAS Cable**: Used for connecting high-performance storage devices in servers and data centers.

### 204. Difference Between CentOS/Redhat 5, 6 and 7

#### 🔄 **Comparison Table**

| **Aspect**              | **CentOS/Redhat 5** | **CentOS/Redhat 6** | **CentOS/Redhat 7** |
| ----------------------- | ------------------- | ------------------- | ------------------- |
| **Kernel Version**      | 2.6.x               | 2.6.x / 3.x         | 3.x                 |
| **Init System**         | SysVinit            | Upstart             | systemd             |
| **Default Filesystem**  | ext3                | ext4                | xfs                 |
| **Package Management**  | RPM                 | Yum                 | Yum                 |
| **Desktop Environment** | GNOME 2             | GNOME 2 / KDE 4     | GNOME 3 / KDE 4     |

#### 🔍 **Troubleshooting in CentOS/Redhat**

Steps for troubleshooting and collecting information in CentOS/Redhat:

```bash
# Collect system information
sudo sosreport

# Check logs
sudo journalctl -xe

# Verify system configuration
sudo systemctl status <service_name>
```

---
