# 📘 **Tutorial: Disk Management and Run Levels**

### 📋 **Table of Contents**

- [System Run Levels (0 thru 6)](#system-run-levels-0-thru-6)
- [Computer Boot Process](#computer-boot-process)
- [Linux Boot Process](#linux-boot-process)
- [Linux Boot Process (Newer Versions)](#linux-boot-process-newer-versions)
- [Message of the Day](#message-of-the-day)
- [Customize Message of the Day](#customize-message-of-the-day)
- [Storage](#storage)
- [Disk Partition (df, `fdisk`)](#disk-partition-df-fdisk)
- [Add Disk and Create Standard Partition](#add-disk-and-create-standard-partition)
- [Logical Volume Management (LVM)](#logical-volume-management-lvm)
- [LVM Configuration During Installation](#lvm-configuration-during-installation)
- [Add Disk and Create New LVM Partition](#add-disk-and-create-new-lvm-partition-pvcreate-vgcreate-lvcreate)
- [Extend Disk using LVM](#extend-disk-using-lvm)

---

### 179. System Run Levels (0 thru 6)

#### 🔍 **Understanding System Run Levels**

System run levels define the operational state of a Linux machine:

| **Run Level** | **Description**                         |
| ------------- | --------------------------------------- |
| 0             | Shutdown (Power off the machine)        |
| 1             | Single-user mode                        |
| 2             | Multi-user mode without networking      |
| 3             | Multi-user mode with networking         |
| 5             | Multi-user mode with networking and GUI |
| 6             | Reboot the system                       |

#### 📝 **Practice Script for Run Levels**

Create a script to practice switching between run levels:

```bash
#!/bin/bash

# Initiate system shutdown
sudo init 0

# Switch to single-user mode
sudo init 1

# Reboot the system
sudo init 6
```

### 180. Computer Boot Process

#### 🚀 **Understanding the Computer Boot Process**

The boot process starts when the computer receives power and goes through several stages:

1. **Power Up**: Machine receives electrical power.
2. **Motherboard**: Basic hardware initialization.
3. **BIOS (Basic Input/Output System)**: Performs POST (Power-On Self Test).
4. **ROM (Read Only Memory)**: Provides system configuration.
5. **CMOS (Complementary Metal-Oxide-Semiconductor)**: Stores BIOS settings.
6. **POST (Power-On Self Test)**: Verifies hardware functionality.
7. **MBR (Master Boot Record)**: Contains the bootloader.
8. **OS Load**: Operating System is loaded into RAM.

#### 💻 **BootStrap Process**

Bootstrap process involves loading the initial set of instructions to start the operating system. It includes BIOS/UEFI, bootloader (GRUB), and kernel initialization.

### 181. Linux Boot Process

#### 🖥️ **Understanding the Linux Boot Process**

The Linux boot process involves several stages:

1. **BIOS/UEFI**: System firmware initializes hardware.
2. **MBR (Master Boot Record)**: Contains the bootloader.
3. **GRUB (Grand Unified Boot Loader)**: Loads the Linux kernel and initramfs.
4. **Kernel**: Core of the operating system.
5. **Init**: Process management system.
6. **RunLevel**: Defines the operational state.

### 182. Linux Boot Process (Newer Versions)

#### 🔄 **Enhanced Linux Boot Process**

Modern Linux distributions use systemd as the init system:

- **BIOS/UEFI**: System firmware interface.
- **MBR**: Bootloader location.
- **GRUB**: Grand Unified Boot Loader.
- **Kernel**: Core OS component.
- **Systemd**: Init and system manager (PID #1).

#### 🔄 **Detailed Linux Boot Process**

1. **BIOS/UEFI**: Initializes hardware and performs POST.
2. **MBR**: Loads GRUB (or another bootloader).
3. **GRUB**: Loads the Linux kernel and initial RAM disk (initrd/initramfs).
4. **Kernel**: Initializes the system and mounts the root filesystem.
5. **Systemd**: Manages system services and starts the user interface.

### 183. Message of the Day

#### 📜 **Message of the Day (Motd)**

The Motd is displayed to users upon login:

- Located at `/etc/motd`.
- Contains system information or important messages.

### 184. Customize Message of the Day

#### 📝 **Customizing Motd**

Customize the Motd for user login:

1. Create `/etc/profile.d/motd.sh`.

   ```bash
   sudo nano /etc/profile.d/motd.sh
   ```

   Add custom messages using echo commands.

2. Modify `/etc/ssh/sshd_config`.

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

   Uncomment or set `PrintMotd yes`.

3. Restart SSH service.

   ```bash
   sudo systemctl restart sshd
   ```

### 185. Storage

#### 🗄️ **Understanding Storage**

Linux supports various storage types:

- **Local Storage**: Internal hard drives.
- **DAS (Direct Attach Storage)**: External drives connected directly.
- **SAN (Storage Area Network)**: Storage over network (ISCSI, fiber cable).
- **NAS (Network Attached Storage)**: Shared storage over TCP/IP (Samba, NFS).

### 186. Disk Partition (df, `fdisk`)

#### 📂 **Managing Disk Partitions**

Use `df` and `fdisk` for disk management:

- **df**: Displays disk usage.

  ```bash
  df -h  # Display disk usage in human-readable format
  ```

- **fdisk**: Disk partitioning.

  ```bash
  sudo fdisk -l  # List all disks and partitions
  ```

#### 📋 **Common Usage for df and fdisk**

- **df**: Check disk space, identify disk usage patterns.
- **fdisk**: Create, modify, delete disk partitions.

### 187. Add Disk and Create Standard Partition

#### 📑 **Adding and Partitioning Disks**

Steps to add and partition a disk:

1. **Add Disk**: Physically install the disk.

2. **Partition with fdisk**.

   ```bash
   sudo fdisk /dev/sdb
   ```

   Follow the prompts to create partitions.

3. **Mount Partition**.

   ```bash
   sudo mkdir /mnt/data
   sudo mount /dev/sdb1 /mnt/data
   ```

4. **Update `/etc/fstab`** to mount partition at boot.

   ```bash
   echo '/dev/sdb1 /mnt/data ext4 defaults 0 0' | sudo tee -a /etc/fstab
   ```

5. **Unmount Partition**.

   ```bash
   sudo umount /mnt/data
   ```

### 188. Logical Volume Management (LVM)

#### 🗃️ **Understanding Logical Volume Management (LVM)**

LVM provides flexible disk management:

- **Physical Volume (PV)**: Physical disk or partition.
- **Volume Group (VG)**: Collection of PVs.
- **Logical Volume (LV)**: Virtual partition from VG.

#### 📊 **LVM Configuration During Installation**

Steps to configure LVM during CentOS installation:

- Choose LVM as the partitioning method.
- Define PVs, VGs, and LVs based on storage requirements.

### 189. Add Disk and Create New LVM Partition (pvcreate, vgcreate, lvcreate)

#### 🖥️ **Adding and Creating LVM Partitions**

Practical script with #stage comments:

```bash
#!/bin/bash

# Stage 1: Create Physical Volume
sudo pvcreate /dev/sdc

# Stage 2: Create Volume Group
sudo vgcreate myvg /dev/sdc

# Stage 3: Create Logical Volume
sudo lvcreate -L 10G -n mylv myvg

# Stage 4: Format Logical Volume
sudo mkfs.ext4 /dev/myvg/mylv

# Stage 5: Mount Logical Volume
sudo mkdir /mnt/mylv
sudo mount /dev/myvg/mylv /mnt/mylv

# Stage 6: Update fstab
echo '/dev/myvg/mylv /mnt/mylv ext4 defaults 0 0' | sudo tee -a /etc/fstab
```

### 190. Extend Disk using LVM

#### ⬆️ **Extending Disk with LVM**

Practical script with #stage comments:

```bash
#!/bin/bash

# Stage 1: Extend Logical Volume
sudo lvextend -L +5G /dev/myvg/mylv

# Stage 2: Resize Filesystem
sudo resize2fs /dev/myvg/mylv
```

---
