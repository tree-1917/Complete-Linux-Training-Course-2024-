# 7 Common Important VM Settings

## 1. 💻 How to Change CPU Allocation?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**: Click on the **Settings** button.
4. **System Settings**: Go to the **System** tab.
5. **Processor Tab**: Adjust the number of CPUs using the slider or input field.
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyvm "VM Name" --cpus <Number of CPUs>
```

Example:

```sh
VBoxManage modifyvm "Ubuntu VM" --cpus 4
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**: Click on **Edit virtual machine settings**.
4. **Hardware Settings**: Go to the **Processors** section.
5. **Adjust CPUs**: Set the number of processors and cores.
6. **Save Changes**: Click **OK**.

**Terminal (VMware Workstation Pro):**

```sh
vmrun -T ws setCoresPerSocket "path/to/vm.vmx" <Cores Per Socket>
vmrun -T ws setNumCPUs "path/to/vm.vmx" <Number of CPUs>
```

## 2. 🧠 How to Change RAM Allocation?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **System Settings**: Go to the **System** tab.
5. **Motherboard Tab**: Adjust the **Base Memory**.
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyvm "VM Name" --memory <RAM in MB>
```

Example:

```sh
VBoxManage modifyvm "Ubuntu VM" --memory 4096
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **Memory**: Adjust the RAM allocation.
5. **Save Changes**: Click **OK**.

**Terminal (VMware Workstation Pro):**

```sh
vmrun -T ws setMem "path/to/vm.vmx" <RAM in MB>
```

## 3. 🗂️ How to Change Hard Disk Space?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **Storage Settings**: Go to the **Storage** tab.
5. **Add New Disk**: Click the **Add Hard Disk** button and follow the wizard.
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyhd "path/to/disk.vdi" --resize <Size in MB>
```

Example:

```sh
VBoxManage modifyhd "/path/to/disk.vdi" --resize 51200
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **Hard Disk**: Click on the hard disk and **Expand** the disk capacity.
5. **Save Changes**: Click **OK**.

#### 4. 🌐 How to Configure Network Settings?

**VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **Network Settings**: Go to the **Network** tab.
5. **Adapter Settings**: Configure the network adapter mode (NAT, Bridged, etc.).
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyvm "VM Name" --nic<N> <mode>
```

Example:

```sh
VBoxManage modifyvm "Ubuntu VM" --nic1 bridged
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **Network Adapter**: Configure the network adapter settings.
5. **Save Changes**: Click **OK**.

#### 5. 🖥️ How to Adjust Display Settings?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **Display Settings**: Go to the **Display** tab.
5. **Video Memory**: Adjust the video memory.
6. **Enable 3D Acceleration**: Check the box if needed.
7. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyvm "VM Name" --vram <VRAM in MB>
```

Example:

```sh
VBoxManage modifyvm "Ubuntu VM" --vram 128
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **Display**: Adjust the display settings.
5. **Save Changes**: Click **OK**.

#### 6. 🔌 How to Manage USB Settings?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **USB Settings**: Go to the **USB** tab.
5. **Enable USB Controller**: Choose USB 2.0 or 3.0 and add USB devices.
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage modifyvm "VM Name" --usb on
VBoxManage usbfilter add 0 --target "VM Name" --name "USB Device" --vendorid <vendor_id> --productid <product_id>
```

Example:

```sh
VBoxManage modifyvm "Ubuntu VM" --usb on
VBoxManage usbfilter add 0 --target "Ubuntu VM" --name "USB Mouse" --vendorid 046d --productid c077
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **USB Controller**: Add or configure USB controllers.
5. **Save Changes**: Click **OK**.

#### 7. 📂 How to Set Up Shared Folders?

> **VirtualBox**

**GUI:**

1. **Open VirtualBox**.
2. **Select Your VM**.
3. **Open Settings**.
4. **Shared Folders**: Go to the **Shared Folders** tab.
5. **Add Shared Folder**: Click the add button and specify the folder path and settings.
6. **Save Changes**: Click **OK**.

**Terminal:**

```sh
VBoxManage sharedfolder add "VM Name" --name "Shared" --hostpath "/path/to/shared/folder" --automount
```

Example:

```sh
VBoxManage sharedfolder add "Ubuntu VM" --name "Shared" --hostpath "/home/user/shared" --automount
```

> **VMware**

**GUI:**

1. **Open VMware**.
2. **Select Your VM**.
3. **Edit Settings**.
4. **Shared Folders**: Add or configure shared folders.
5. **Save Changes**: Click **OK**.

### Conclusion

These seven settings cover the essential aspects of managing a virtual machine, ensuring you can optimize and configure your VM according to your needs. Whether you use the GUI or the terminal, these steps will help you efficiently manage CPU, RAM, hard disk space, network settings, display settings, USB devices, and shared folders for both VirtualBox and VMware.
