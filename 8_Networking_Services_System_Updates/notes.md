# 🌐 **Network Services System**

This tutorial covers various aspects of network services in Linux, including enabling internet on VMs, understanding network components, managing network interfaces, and using network utilities. It also includes details on file transfer protocols and advanced package management.

## 📑 **Table of Contents**

1. [139. Enable Internet on Linux VM](#139-enable-internet-on-linux-vm)
2. [140. Network Components](#140-network-components)
3. [141. Network Files and Commands](#141-network-files-and-commands)
4. [142. NIC Information](#142-nic-information)
5. [143. NIC or Port Bonding](#143-nic-or-port-bonding)
6. [144. New Network Utilities](#144-new-network-utilities)
7. [145. Downloading Files or Apps (wget)](#145-downloading-files-or-apps-wget)
8. [146. curl and ping commands](#146-curl-and-ping-commands)
9. [147. FTP - File Transfer Protocol](#147-ftp-file-transfer-protocol)
10. [148. SCP - Secure Copy Protocol](#148-scp-secure-copy-protocol)
11. [149. rsync - Remote Synchronization](#149-rsync-remote-synchronization)
12. [150. System Updates and Repos (rpm, yum)](#150-system-updates-and-repos-rpm-yum)
13. [151. System Upgrade and Patch Management](#151-system-upgrade-and-patch-management)
14. [152. Create Local Repository (Yum Server)](#152-create-local-repository-yum-server)
15. [153. Advance Package Management](#153-advance-package-management)
16. [154. Rollback Patches and Updates](#154-rollback-patches-and-updates)
17. [155. SSH and Telnet](#155-ssh-and-telnet)

---

## 139. **Enable Internet on Linux VM**

### How to Enable Internet on Linux VM?

To enable the internet on a Linux VM, follow these steps:

- **Settings**:

  - **Network**:
    - **Attach to**: Network Bridge

  **Steps:**

  1. Open the VM settings in your virtualization software (e.g., VirtualBox, VMware).
  2. Go to the **Network** section.
  3. Select **Attached to** and choose **Bridged Adapter**.
  4. Save the settings and start the VM.

---

## 140. **Network Components**

### What are Network Components?

- **IP Address**: A unique identifier for a device on a network.
- **Subnet Mask**: Defines the network and host portion of an IP address.
- **Gateway**: The device that routes traffic from the local network to other networks.
- **Static vs. DHCP**:
  - **Static**: Fixed IP address assigned manually.
  - **DHCP**: IP address assigned automatically by a DHCP server.
- **Interface**: Network interface card (NIC) or virtual interface.
- **Interface MAC Address**: The unique hardware address of a network interface.

---

## 141. **Network Files and Commands**

### What are Commands Using IN Network and Files for Config?

- **Interface Detection**:

  ```bash
  ip link show
  ```

- **Assigning an IP Address**:

  ```bash
  sudo ip addr add <IP_ADDRESS>/24 dev <INTERFACE>
  ```

- **Interface Config Files**:
  - **/etc/nsswitch.conf**: Configures the order of services for name resolution.
  - **/etc/hostname**: Contains the system's hostname.
  - **/etc/sysconfig/network**: Network configuration file (CentOS/RHEL).
  - **/etc/sysconfig/network-scripts/ifcfg-<INTERFACE>**: Interface configuration (CentOS/RHEL).
  - **/etc/resolv.conf**: DNS resolver configuration.

---

## 142. **NIC Information**

### What is **NIC**?

**NIC** (Network Interface Card) is a hardware component that allows a computer to connect to a network.

### What Commands Handle **NIC**?

- **Check NIC Status**:

  ```bash
  ip link show <NIC>
  ```

- **Get NIC Information**:

  ```bash
  ethtool <NIC>
  ```

- **View NIC Configuration**:
  ```bash
  ifconfig <NIC>
  ```

### Scripts to Handle NIC:

1. **Check NIC Status**:

   ```bash
   #!/bin/bash
   ip link show eth0
   ```

2. **Get NIC Information**:

   ```bash
   #!/bin/bash
   ethtool eth0
   ```

3. **View NIC Configuration**:
   ```bash
   #!/bin/bash
   ifconfig eth0
   ```

---

## 143. **NIC or Port Bonding**

### What is **NIC or Port Bonding**?

**NIC Bonding** or **Port Bonding** is a method of combining multiple network interfaces into a single logical interface to provide high availability and redundancy.

### Features of **NIC or Port Bonding**:

| Feature               | Description                                        |
| --------------------- | -------------------------------------------------- |
| **High Availability** | Ensures network connectivity in case of a failure. |
| **Redundancy**        | Provides backup connections if one link fails.     |
| **Load Balancing**    | Distributes network traffic across multiple links. |

### NIC Bonding Procedure:

1. **Load Bonding Module**:

   ```bash
   sudo modprobe bonding
   ```

2. **Check Bonding Information**:

   ```bash
   sudo modinfo bonding
   ```

3. **Create Bond Configuration**:

   - **Create `/etc/sysconfig/network-scripts/ifcfg-bond0`**:
     ```bash
     DEVICE=bond0
     BONDING_OPTS="mode=1 miimon=100 updelay=200 downdelay=200"
     ONBOOT=yes
     BOOTPROTO=none
     ```
   - **Edit `/etc/sysconfig/network-scripts/ifcfg-eth0`**:
     ```bash
     DEVICE=eth0
     MASTER=bond0
     SLAVE=yes
     ONBOOT=yes
     ```
   - **Edit `/etc/sysconfig/network-scripts/ifcfg-eth1`**:
     ```bash
     DEVICE=eth1
     MASTER=bond0
     SLAVE=yes
     ONBOOT=yes
     ```

4. **Restart Network**:

   ```bash
   sudo systemctl restart network
   ```

5. **Check Bonding Status**:
   ```bash
   cat /proc/net/bonding/bond0
   ```

---

## 144. **New Network Utilities**

### What is **Network Manager**?

**Network Manager** is a tool used to manage network connections in Linux.

### What are **nmcli**, **nmtui**, **nm-connection-editor**, and **GNOME Settings**?

- **nmcli**: Command-line interface for Network Manager.

  ```bash
  nmcli device status
  ```

- **nmtui**: Text user interface for Network Manager.

  ```bash
  nmtui
  ```

- **nm-connection-editor**: GUI tool for managing network connections.

  ```bash
  nm-connection-editor
  ```

- **GNOME Settings**: Network settings accessible from the GNOME desktop environment.

### How to Create NIC Bonding Using Network Manager?

- **nmcli**:
  ```bash
  nmcli con add type bond con-name bond0 ifname bond0 mode 802.3ad
  nmcli con add type ethernet con-name bond0-slave1 ifname eth0 master bond0
  nmcli con add type ethernet con-name bond0-slave2 ifname eth1 master bond0
  ```

---

## 145. **Downloading Files or Apps (wget)**

### How to Use Wget to Download Files?

**wget** is a command-line utility for downloading files from the web.

### Examples with **wget**:

1. **Download a File**:

   ```bash
   wget http://example.com/file.txt
   ```

2. **Download a File with a Different Name**:

   ```bash
   wget -O newname.txt http://example.com/file.txt
   ```

3. **Download Multiple Files**:
   ```bash
   wget -i filelist.txt
   ```

### Common **wget** Options:

| Option | Description                           |
| ------ | ------------------------------------- |
| `-O`   | Output to a specific file.            |
| `-i`   | Download files listed in a text file. |
| `-c`   | Resume a partially downloaded file.   |

---

## 146. **curl and ping commands**

### How to Use **curl**?

**curl** is a tool for transferring data from or to a server using various protocols.

### Examples with **curl**:

1. **Fetch a Web Page**:

   ```bash
   curl http://example.com
   ```

2. **Download a File**:

   ```bash
   curl -O http://example.com/file.txt
   ```

3. **Send Data via POST**:
   ```bash
   curl -X POST -d "key=value" http://example.com/resource
   ```

### How to Use **ping**?

**ping** is used

to check the connectivity between two hosts.

### Examples with **ping**:

1. **Ping a Host**:

   ```bash
   ping example.com
   ```

2. **Ping a Host with Specific Count**:

   ```bash
   ping -c 4 example.com
   ```

3. **Ping a Host with Specific Interval**:
   ```bash
   ping -i 2 example.com
   ```

---

## 147. **FTP - File Transfer Protocol**

### What is **FTP**?

**FTP** (File Transfer Protocol) is a standard network protocol used to transfer files between a client and a server.

### What is **Protocol**?

A protocol is a set of rules for data communication between devices.

### Default FTP Port:

- **Port 21**.

### Process to Install and Configure **FTP**:

1. **Install FTP Server**:

   - **Debian/Ubuntu**:
     ```bash
     sudo apt install vsftpd
     ```
   - **CentOS/RHEL**:
     ```bash
     sudo yum install vsftpd
     ```

2. **Start and Enable FTP Service**:

   ```bash
   sudo systemctl start vsftpd
   sudo systemctl enable vsftpd
   ```

3. **Configure FTP Server**:
   - Edit `/etc/vsftpd.conf` to adjust settings.

### Examples of Moving Files:

1. **Upload File to Server**:

   ```bash
   ftp example.com
   # Use `put` command to upload
   ```

2. **Download File from Server**:

   ```bash
   ftp example.com
   # Use `get` command to download
   ```

3. **List Files on Server**:
   ```bash
   ftp example.com
   # Use `ls` command to list files
   ```

---

## 148. **SCP - Secure Copy Protocol**

### What is **SCP**?

**SCP** (Secure Copy Protocol) is a network protocol that uses SSH to securely transfer files between hosts.

### Compare **SCP** vs **FTP**:

| Feature            | SCP                      | FTP                |
| ------------------ | ------------------------ | ------------------ |
| **Security**       | Uses SSH for encryption. | No encryption.     |
| **Port**           | Port 22                  | Port 21            |
| **Authentication** | Uses SSH keys/passwords. | No authentication. |

### Default **SCP Port**:

- **Port 22**.

### Process to Install and Configure **SCP**:

- **SCP** is part of the **OpenSSH** package.

1. **Install OpenSSH**:

   - **Debian/Ubuntu**:
     ```bash
     sudo apt install openssh-server
     ```
   - **CentOS/RHEL**:
     ```bash
     sudo yum install openssh-server
     ```

2. **Start and Enable SSH Service**:
   ```bash
   sudo systemctl start sshd
   sudo systemctl enable sshd
   ```

### Examples with **SCP**:

1. **Copy File to Remote Server**:

   ```bash
   scp file.txt user@remote:/path/to/destination
   ```

2. **Copy File from Remote Server**:

   ```bash
   scp user@remote:/path/to/file.txt /local/destination
   ```

3. **Copy Directory to Remote Server**:

   ```bash
   scp -r dir/ user@remote:/path/to/destination
   ```

4. **Copy Directory from Remote Server**:
   ```bash
   scp -r user@remote:/path/to/dir/ /local/destination
   ```

---

## 149. **rsync - Remote Synchronization**

### What is **rsync**?

**rsync** is a tool for synchronizing files and directories between two locations.

### Types of Backup:

- **Full Backup**: Complete copy of all data.
- **Incremental Backup**: Only copies changes since the last backup.
- **Differential Backup**: Copies changes since the last full backup.

### Examples of Backups with **rsync**:

1. **Full Backup**:

   ```bash
   rsync -av /source/ /destination/
   ```

2. **Incremental Backup**:

   ```bash
   rsync -av --link-dest=/previous/ /source/ /destination/
   ```

3. **Differential Backup**:
   ```bash
   rsync -av --compare-dest=/last-full-backup/ /source/ /destination/
   ```

### Archive and Compress Data:

```bash
rsync -avz /source/ /destination/
```

---

## 150. **System Updates and Repos (rpm, yum)**

### What Mean **System Update and Repos**?

**System Update**: Applying updates to the operating system and software.

**Repos**: Repositories that store packages for installation and updates.

### How to Handle **System Update and Repos**:

1. **Update System**:

   - **Debian/Ubuntu**:

     ```bash
     sudo apt update
     sudo apt upgrade
     ```

   - **CentOS/RHEL**:
     ```bash
     sudo yum update
     ```

2. **Add Repository**:

   - **Debian/Ubuntu**:

     ```bash
     sudo add-apt-repository ppa:repository-name
     ```

   - **CentOS/RHEL**:
     ```bash
     sudo yum-config-manager --add-repo http://repo.url/path.repo
     ```

### Examples:

1. **Update All Packages**:

   ```bash
   sudo apt update && sudo apt upgrade
   ```

2. **Install Package from Repo**:
   ```bash
   sudo yum install package-name
   ```

---

## 151. **System Upgrade and Patch Management**

### What Mean **System Upgrade and Patch Management**?

**System Upgrade**: Upgrading the operating system or software to a newer version.

**Patch Management**: Applying patches to fix vulnerabilities or bugs.

### What Mean **Patch**?

A patch is a software update that fixes bugs, vulnerabilities, or other issues.

### Types of **Upgrades** In Linux System:

- **Major Version**: Significant changes and new features (e.g., Ubuntu 20.04 to 22.04).
- **Minor Version**: Smaller updates and improvements (e.g., Ubuntu 20.04.1 to 20.04.2).

### Difference Between Update and Upgrade:

- **Update**: Refers to minor updates, including security patches and bug fixes.
- **Upgrade**: Refers to major changes, including new features and enhancements.

### Examples:

1. **Upgrade System**:

   - **Debian/Ubuntu**:
     ```bash
     sudo apt update
     sudo apt upgrade
     sudo apt dist-upgrade
     ```

2. **Apply Patches**:
   ```bash
   sudo yum update
   ```

---

## 152. **Create Local Repository (Yum Server)**

### How to Create Local Repository?

1. **Install Required Packages**:

   ```bash
   sudo yum install createrepo
   ```

2. **Create Repository**:
   - **Create Directory**:
     ```bash
     mkdir /path/to/repo
     ```
   - **Add Packages**:
     ```bash
     cp /path/to/packages/*.rpm /path/to/repo/
     ```
   - **Create Repository Metadata**:
     ```bash
     createrepo /path/to/repo
     ```

### How to Make a Local Repository from My Scripts?

1. **Create Repository Directory**:

   ```bash
   mkdir /my-local-repo
   ```

2. **Add Packages**:

   ```bash
   cp /path/to/my-packages/*.rpm /my-local-repo/
   ```

3. **Generate Metadata**:
   ```bash
   createrepo /my-local-repo
   ```

### Tools to Create Local Repository:

- **createrepo_c**: A faster and more efficient version of `createrepo`.
- **reposync**: Synchronizes repositories.

### Configure Package Manager to Search Local Repo:

- **CentOS/RHEL**:
  - **Edit `/etc/yum.repos.d/local.repo`**:
    ```ini
    [local-repo]
    name=Local Repository
    baseurl=file:///my-local-repo
    enabled=1
    gpgcheck=0
    ```

---

## 153. **Advance Package Management**

### How to Advance Package Management?

- **Install Package**:

  - **Debian/Ubuntu**:
    ```bash
    sudo apt install package-name
    ```
  - **CentOS/RHEL**:
    ```bash
    sudo yum install package-name
    ```

- **Upgrade Package**:

  - **Debian/Ubuntu**:
    ```bash
    sudo apt upgrade package-name
    ```
  - **CentOS/RHEL**:
    ```bash
    sudo yum update package-name
    ```

- **Downgrade Package**:

  - **Debian/Ubuntu**:
    ```bash
    sudo apt install package-name=version
    ```
  - **CentOS/RHEL**:
    ```bash
    sudo yum downgrade package-name
    ```

- **Remove Package**:

  - **Debian/Ubuntu**:
    ```bash
    sudo apt remove package-name
    ```
  - **CentOS/RHEL**:
    ```bash
    sudo yum remove package-name
    ```

- **Fix Broken Packages**:
  - \*\*Debian/Ubuntuis tutorial provides a comprehensive guide to network services, file transfer protocols, and package management in Linux, tailored for both beginners and advanced users.

\*\*:
`bash
    sudo apt --fix-broken install
    `

- **CentOS/RHEL**:
  ```bash
  sudo yum-complete-transaction
  ```

### How to Configure Package Manual?

- **Debian/Ubuntu**:

  - **Edit `/etc/apt/sources.list`** to configure repositories.

- **CentOS/RHEL**:
  - **Edit `/etc/yum.repos.d/*.repo`** to configure repositories.

---

## 154. **Rollback Patches and Updates**

### What Mean **Rollback** Patches and Updates?

**Rollback** refers to reverting to a previous state before a patch or update was applied.

### What Mean **Rollback a Package or Patch**?

Rolling back a package or patch means restoring the previous version of the software or system state.

### How to Fix Broken Package?

1. **Debian/Ubuntu**:

   ```bash
   sudo apt --fix-broken install
   ```

2. **CentOS/RHEL**:
   ```bash
   sudo yum-complete-transaction
   ```

### How to Use **Timeshift** and **Btrfs**?

- **Timeshift**: A tool for creating and restoring system snapshots.

  ```bash
  sudo apt install timeshift
  sudo timeshift --create
  sudo timeshift --restore
  ```

- **Btrfs**: A modern filesystem with support for snapshots and rollbacks.

  - **Create Snapshot**:

    ```bash
    sudo btrfs subvolume snapshot /mnt/subvolume /mnt/snapshot
    ```

  - **Rollback to Snapshot**:
    ```bash
    sudo btrfs subvolume delete /mnt/subvolume
    sudo btrfs subvolume snapshot /mnt/snapshot /mnt/subvolume
    ```

---

## 155. **SSH and Telnet**

### What are **Telnet**?

**Telnet** is a protocol for remote text-based communication with a server.

### What are **SSH**?

**SSH** (Secure Shell) is a protocol for secure remote communication with a server.

### Types of Packages for Most Services:

- **Client Package**: Installed on the client machine (e.g., `telnet`, `ssh`).
- **Server Package**: Installed on the server (e.g., `telnetd`, `sshd`).

---
