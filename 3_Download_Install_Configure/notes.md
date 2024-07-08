# Download, Install and Configure

> Outline :

- [ ]
- [ ]

---

## Content

### 18. Lab Design

- How to Have Linux OS on Your Computer?

  1. **Virtual Machine 🖥️**:

     - Install a hypervisor like VirtualBox or VMware.
     - Create a VM and install Linux on it.

  2. **Cloud ☁️**:

     - Sign up for a cloud service like AWS, Google Cloud, or Azure.
     - Launch a Linux virtual instance.

### 19. What is Virtual Box?

- What is Oracle VirtualBox?

  - **Hypervisor by Oracle Corporation 🏢**: A tool that allows multiple operating systems to run on a single hardware simultaneously.
  - **Extended Capabilities 💻**: It extends the capabilities of your existing computer so that it can run multiple operating systems on one hardware at the same time.

### 20. Downloading and Installing Oracle VirtualBox

- How to Download and Install Oracle VirtualBox?

  1. **Open Internet Browser 🌐**: Visit [www.virtualbox.org](http://www.virtualbox.org).

  2. **Download Page 📥**: Navigate to the download page and download the latest version of the software for your operating system.

  3. **Install and Configure 🛠️**: Run the installer and follow the on-screen instructions to install and configure Oracle VirtualBox on your computer.

### 21. Download and Install VMWare Player (Optional)

- How to Download and Install VMware Workstation Player?

  1. **Open Internet Browser 🌐**: Visit [www.vmware.com](http://www.vmware.com).
  2. **Download Page 📥**: Navigate to the Workstation Player section and download the latest version of the software for your operating system.
  3. **Install and Configure 🛠️**: Run the installer and follow the on-screen instructions to install and configure VMware Workstation Player on your computer.

### 22. CentOS vs. CentOS Stream

- Brief History of CentOS 🕰️

  CentOS (Community ENTerprise Operating System) is a free, open-source, enterprise-class Linux distribution. It was derived from the sources of Red Hat Enterprise Linux (RHEL).

- Sequence:

  - **Traditional Path**:
    - **Fedora** ➡️ **RHEL** ➡️ **CentOS**
  - **New Path**:

    - **Fedora** ➡️ **CentOS Stream** ➡️ **RHEL**

CentOS Stream serves as a rolling preview of what the next RHEL minor version will be, providing a more frequent update stream than traditional CentOS.

- Is it Worth Learning CentOS?

Yes, learning CentOS is valuable, especially for those interested in enterprise environments and systems administration. It provides a solid foundation in RHEL-based systems, widely used in the industry.

### 23. Different Ways to Install Linux

> Different Ways to Install an OS

1. **CD/DVD-ROM 💿**: Use a bootable CD or DVD containing the OS installation files.

2. **ISO File 📂**:

   - **Virtual Disk**: Mount the ISO as a virtual disk.
   - **Console Access**:
     - **Dell**: Use iDRAC (Integrated Dell Remote Access Controller).
     - **HP**: Use iLO (Integrated Lights-Out).

3. **Network Boot 🌐**: Use PXE (Preboot Execution Environment) to boot and install the OS over the network.

4. **USB Drive 🔌**: Create a bootable USB drive with the OS installation files and use it to install the OS.

- **`More About Console Access`**

Console access tools like iDRAC (Dell) and iLO (HP) provide remote management capabilities, allowing you to manage and install an OS on servers even when you don’t have physical access. Below are the steps and commands to install an OS using these tools.

> Simple Tutorial for Console Access Installation with Commands

**Using Dell iDRAC**:

1. **Log in to iDRAC**:

   - Open a web browser and enter the iDRAC IP address.
   - Log in with your credentials.

2. **Launch Virtual Console**:

   - Navigate to the "Console" tab.
   - Click on "Launch Virtual Console".

3. **Mount ISO File**:

   - In the Virtual Console window, go to "Virtual Media" > "Connect Virtual Media".
   - Click on "Map CD/DVD" and browse to select your ISO file.

4. **Reboot Server**:

   - Navigate to the "Power" tab and select "Reset System (warm boot)".
   - The server will reboot and boot from the mounted ISO file.

   **Commands (via SSH to iDRAC)**:

   ```sh
   ssh root@<iDRAC_IP>
   racadm media -u -d cdrom
   racadm media -c -d cdrom -u <URL_to_ISO>
   racadm serveraction powercycle
   ```

5. **Install OS**:
   - Follow the on-screen instructions to install the operating system.

**Using HP iLO**:

1. **Log in to iLO**:

   - Open a web browser and enter the iLO IP address.
   - Log in with your credentials.

2. **Launch Remote Console**:

   - Navigate to the "Remote Console" tab.
   - Click on "Launch" to open the remote console.

3. **Mount ISO File**:

   - In the remote console window, go to "Virtual Drives" > "Image File CD/DVD-ROM".
   - Browse and select your ISO file.

4. **Reboot Server**:

   - Navigate to the "Power Management" tab and select "Reset".
   - The server will reboot and boot from the mounted ISO file.

   **Commands (via SSH to iLO)**:

   ```sh
   ssh Administrator@<iLO_IP>
   vm cdrom insert <URL_to_ISO>
   reset /system1
   ```

5. **Install OS**:
   - Follow the on-screen instructions to install the operating system.

By following these steps and using the respective commands, you can easily install an operating system remotely using console access tools like iDRAC and iLO.

### 24. Creating a Virtual Machine

> Creating a Virtual Machine using Oracle VM VirtualBox 📦

1. **Open VirtualBox:** Launch from the applications menu.
2. **Click "New":** Start creating a new VM.
3. **Name and OS:** Enter a name, select OS type and version.
4. **Memory Size:** Allocate RAM.
5. **Hard Disk:** Create a virtual hard disk.
6. **Disk File Type:** Choose VDI, dynamically allocated or fixed size.
7. **Disk Size:** Set the disk size.
8. **Configure Settings (Optional):** Adjust network, shared folders, etc.
9. **Install OS:** Insert installation media, start VM, follow OS install prompts.
10. **Guest Additions (Optional):** Install for extra features.

> Creating a Virtual Machine on VMware Workstation Player 🛠️

1. **Open VMware Player:** Launch from the applications menu.
2. **Click "Create a New Virtual Machine":** Start the wizard.
3. **Guest OS:** Select OS type and version.
4. **VM Name and Location:** Enter name and location.
5. **Disk Capacity:** Set maximum disk size, choose storage method.
6. **Finish:** Review and create the VM.
7. **Install OS:** Insert installation media, play VM, follow install prompts.
8. **VMware Tools (Optional):** Install for enhanced performance.

### 25. Download and Install Linux (CentOS 7, CentOs 8, Centos 9)

#### 1. 🖥️ Download the ISO

1. 🌐 **Visit the CentOS Website**: Go to the [CentOS official website](https://www.centos.org/download/).
2. 🛠️ **Select the Version**: Choose "CentOS Linux 7" from the available options.
3. 💾 **Download the ISO**: Click on the "ISO" link and select a mirror close to your location to download the CentOS 7 ISO file.

#### 2. 💿 Create a Bootable USB Drive

> Using Rufus (Windows):

1. 📥 **Download Rufus**: Download Rufus from [rufus.ie](https://rufus.ie/).
2. 🔌 **Insert USB Drive**: Plug in your USB drive (at least 4GB).
3. ⚙️ **Open Rufus**: Launch the Rufus application.
4. 🔍 **Select Device**: Choose your USB drive under "Device".
5. 📂 **Select ISO**: Click "Select" and choose the downloaded CentOS 7 ISO file.
6. 📝 **Start the Process**: Click "Start" to create the bootable USB drive.

#### Using dd (Linux/Mac):

1. 🌐 **Open Terminal**: Launch your terminal application.
2. 🔌 **Insert USB Drive**: Plug in your USB drive.
3. 💾 **Locate USB Drive**: Find the USB drive path using `lsblk` or `diskutil list` (for macOS).
4. 🛠️ **Create Bootable USB**: Use the following command (replace `/path/to/CentOS-7.iso` and `/dev/sdX` accordingly):

   ```bash
   sudo dd if=/path/to/CentOS-7.iso of=/dev/sdX bs=4M status=progress && sync
   ```

#### 3. ⚙️ Install CentOS 7

1. 🖥️ **Boot from USB**: Restart your computer and boot from the USB drive (you may need to change the boot order in BIOS/UEFI settings).
2. 🚀 **Start Installation**: Select "Install CentOS 7" from the boot menu.
3. 🌍 **Choose Language**: Select your preferred language and click "Continue".
4. 📍 **Set Installation Destination**: Choose the disk where you want to install CentOS 7 and click "Done".
5. 🛠️ **Configure Network & Hostname**: Optionally, configure your network settings and set a hostname.
6. 🕹️ **Begin Installation**: Click "Begin Installation".
7. 🔐 **Set Root Password**: Set a strong root password.
8. 👤 **Create User**: Create a user account.
9. ⏳ **Wait for Installation to Complete**: The installation process will take some time. Once complete, click "Reboot".

#### 4. 🚀 Post-Installation Setup

1. 🌐 **Update System**: After logging in, open the terminal and update your system:

   ```bash
   sudo yum update -y
   ```

2. 🛠️ **Install Additional Software**: Install any additional software you need using `yum` or `dnf` package manager.

#### 5. 🎉 Enjoy CentOS 7

You have successfully installed CentOS 7! Enjoy exploring and using your new Linux environment.

### 32. Take a snapshot of VM

> 📸 Taking a Snapshot of a Virtual Machine

Taking a snapshot of a VM allows you to capture the current state of the VM, including its memory, settings, and disk state. This is useful for creating backups, testing, or saving a particular state of the VM to revert to later.

#### Prerequisites

- A hypervisor or virtualization software (e.g., VMware, VirtualBox, Hyper-V).
- An existing virtual machine.

#### Steps for Different Virtualization Software

##### 🖥️ VirtualBox

1. **Open VirtualBox:**
   Open the VirtualBox application.

2. **Select the VM:**
   Select the virtual machine you want to take a snapshot of from the list on the left.

3. **Take a Snapshot:**

   - 🛠️ Click on the **Snapshots** button.
   - ➕ Click on the **Take** icon or right-click the VM and select **Take Snapshot**.
   - ✏️ **Name your snapshot** and optionally add a description.
   - 📸 Click **OK** to create the snapshot.

   **Command:**

   ```sh
   VBoxManage snapshot "VM Name" take "Snapshot Name" --description "Snapshot Description"
   ```

##### 🖥️ VMware

1. **Open VMware Workstation/Player:**
   Open the VMware application.

2. **Select the VM:**
   Select the virtual machine you want to snapshot.

3. **Take a Snapshot:**

   - 🛠️ Go to the **VM** menu.
   - ➕ Click **Snapshot** and then **Take Snapshot**.
   - ✏️ **Name your snapshot** and optionally add a description.
   - 📸 Click **OK** to create the snapshot.

   **Command (for VMware Workstation Pro):**

   ```sh
   vmrun -T ws snapshot "path/to/vm.vmx" "Snapshot Name"
   ```

##### 🖥️ Hyper-V

1. **Open Hyper-V Manager:**
   Open the Hyper-V Manager application.

2. **Select the VM:**
   Select the virtual machine you want to snapshot from the list.

3. **Take a Snapshot:**

   - 🛠️ Right-click the VM and select **Checkpoint**.
   - ✏️ **Name your checkpoint** and optionally add a description.
   - 📸 Click **OK** to create the checkpoint.

   **Command:**

   ```powershell
   Checkpoint-VM -Name "VM Name" -SnapshotName "Snapshot Name"
   ```

##### 🤔 Why Take Snapshots?

- **Backup and Recovery:** Easily revert to a known good state if something goes wrong.
- **Testing and Development:** Create multiple states of a VM for testing different configurations or updates.
- **System Upgrades:** Safeguard your current state before performing major upgrades or changes.

##### ⚠️ Important Considerations

- **Storage:** Snapshots can consume a significant amount of disk space.
- **Performance:** Running VMs with multiple snapshots can impact performance.
- **Management:** Regularly manage and delete old snapshots to free up resources.

##### 🎉 Conclusion

Taking snapshots of your VMs is a powerful tool for managing and maintaining your virtual environments. Whether you're using VirtualBox, VMware, or Hyper-V, the process is straightforward and can save you a lot of time and hassle.

---
