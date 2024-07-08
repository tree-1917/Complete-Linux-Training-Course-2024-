# Creating a Ubuntu Virtual Machine with QEMU and libvirt

#### Step-by-Step Tutorial

1. **Install Required Packages**

   ```bash
   sudo apt update
   sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients virtinst bridge-utils
   ```

2. **Download Ubuntu ISO**

   ```bash
   wget https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso
   ```

3. **Create a Virtual Disk Image**

   ```bash
   qemu-img create -f qcow2 ubuntu-vm.qcow2 20G
   ```

4. **Create Virtual Machine with virt-install**

   ```bash
   sudo virt-install \
   --name ubuntu-vm \
   --ram 2048 \
   --vcpus 2 \
   --disk path=ubuntu-vm.qcow2,format=qcow2 \
   --os-type linux \
   --os-variant ubuntu20.04 \
   --network bridge=virbr0 \
   --graphics spice \
   --cdrom ubuntu-20.04.3-desktop-amd64.iso \
   --boot menu=on
   ```

5. **Follow Ubuntu Installation**
   - Proceed with installation via the graphical interface provided by the Ubuntu ISO.

### QEMU Overview

- **QEMU (Quick EMUlator)**
  - 🖥️ Open-source emulator and virtualizer.
  - 🛠️ Supports multiple architectures and execution modes.
  - 🌐 Enables running guest OS and applications on different host systems.
  - 💻 Essential for development, testing, and virtualization tasks.

#### Common Options for QEMU

| Option      | Description                                                 |
| ----------- | ----------------------------------------------------------- |
| `-cpu`      | Specify the CPU model and features to emulate.              |
| `-m`        | Set the amount of RAM allocated to the VM.                  |
| `-smp`      | Configure the number of virtual CPUs.                       |
| `-drive`    | Manage disk images and devices.                             |
| `-net`      | Define networking options and virtual NICs.                 |
| `-display`  | Configure display settings (e.g., `-display spice`).        |
| `-usb`      | Enable USB passthrough to the VM.                           |
| `-snapshot` | Use snapshot mode for disk images.                          |
| `-monitor`  | Enable QEMU monitor interface for management.               |
| `-serial`   | Redirect VM serial console to host's serial device or file. |
| `-soundhw`  | Enable virtual sound hardware.                              |

### libvirt Overview

- **libvirt**
  - 📡 Open-source API, toolkit, and daemon.
  - 🕹️ Manages virtualization platforms and hypervisors like QEMU, KVM, and Xen.
  - 🖥️ Provides unified management interface for VMs.
  - 🧰 Simplifies virtualization management with CLI tools (`virsh`) and GUI tools (`virt-manager`).

#### Common Options for libvirt (via `virsh`)

Certainly! Here are the common `virsh` options organized into tables for easier reference:

> Virtual Machine Management

| Command    | Description                                     |
| ---------- | ----------------------------------------------- |
| `list`     | List all active VMs or defined VMs.             |
| `start`    | Start a specified VM.                           |
| `shutdown` | Gracefully shutdown a running VM.               |
| `define`   | Define a new VM from an XML configuration file. |
| `console`  | Access the VM console for direct interaction.   |
| `destroy`  | Immediately stop and destroy a VM.              |

> Snapshot Management

| Command            | Description                                             |
| ------------------ | ------------------------------------------------------- |
| `snapshot-create`  | Create a snapshot of a VM's current state.              |
| `snapshot-revert`  | Revert a VM to a previous snapshot.                     |
| `snapshot-delete`  | Delete a VM snapshot.                                   |
| `snapshot-list`    | List all snapshots associated with a VM.                |
| `snapshot-info`    | Display detailed information about a specific snapshot. |
| `snapshot-dumpxml` | Output the XML configuration of a snapshot.             |

> Configuration Management

| Command     | Description                                                          |
| ----------- | -------------------------------------------------------------------- |
| `undefine`  | Remove a defined VM configuration without affecting its disk images. |
| `edit`      | Edit the XML configuration of a defined VM.                          |
| `dumpxml`   | Output the XML configuration of a specific VM.                       |
| `autostart` | Configure a VM to start automatically on host boot.                  |

> Advanced Operations

| Command   | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| `suspend` | Pause a running VM and save its state to resume later.                 |
| `resume`  | Resume a suspended VM to continue its operation.                       |
| `reboot`  | Reboot a running VM.                                                   |
| `save`    | Save the current state of a running VM to a file for later resumption. |
| `restore` | Restore a VM from a previously saved state file.                       |
| `migrate` | Migrate a running VM to another host.                                  |

> Device and Resource Management

| Command            | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| `attach-device`    | Attach a device to a running VM.                             |
| `detach-device`    | Detach a device from a running VM.                           |
| `setmem`           | Adjust the memory allocation of a running VM.                |
| `setvcpus`         | Adjust the number of virtual CPUs allocated to a running VM. |
| `attach-interface` | Attach a virtual network interface to a running VM.          |
