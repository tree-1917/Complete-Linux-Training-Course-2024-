# 🌐 Networking Services System Updates

## 📖 Outline

1. [Firewall](#firewall)
2. [Tune System Performance](#tune-system-performance)
3. [Run Containers - Podman](#run-containers-podman)
4. [Kickstart - Automate Linux Installation](#kickstart)
5. [DHCP Server](#dhcp-server)

---

## 🔥 Firewall <a name="firewall"></a>

### What is a Firewall?

A firewall acts as a **watchman** for your network, monitoring and controlling incoming and outgoing network traffic based on predetermined security rules. 🛡️

### Types of Firewalls:

1. **Software Firewalls**: Installed on individual devices. 💻
2. **Hardware Firewalls**: Standalone devices that protect the entire network. 🖥️

### What Types of Firewall?

- **iptables**: Older but widely used.
  - **Tables**: Structures to store rules.
  - **Chains**: Predefined lists of rules.
  - **Target**: Actions taken when a rule matches.
- **firewalld**: Newer and dynamic.
  - **Tables**: More flexible.
  - **Chains**: Easier to manage.
  - **Target**: Customizable actions.

![Firewall Types](https://via.placeholder.com/600x300?text=Firewall+Types+Graph)

### Adding Configuration to Firewall

To configure firewalls, you can use commands like:

```bash
firewall-cmd --add-port=1000/tcp
firewall-cmd --remove-port=1000/tcp
firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.0.20" reject'
firewall-cmd --add-icmp-block-inversion
firewall-cmd --remove-icmp-block-inversion
firewall-cmd --direct --add-rule ipv4 filter OUTPUT 0 -d 31.13.71.33 -j DROP
```

### Common Configurations Table

| **Action**                      | **Command**                                                                              |
| ------------------------------- | ---------------------------------------------------------------------------------------- |
| Add TCP port 1000               | `firewall-cmd --add-port=1000/tcp`                                                       |
| Remove TCP port 1000            | `firewall-cmd --remove-port=1000/tcp`                                                    |
| Reject traffic from specific IP | `firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.0.20" reject'` |
| Enable ICMP block inversion     | `firewall-cmd --add-icmp-block-inversion`                                                |
| Remove ICMP block inversion     | `firewall-cmd --remove-icmp-block-inversion`                                             |
| Drop traffic to a specific IP   | `firewall-cmd --direct --add-rule ipv4 filter OUTPUT 0 -d 31.13.71.33 -j DROP`           |

---

## ⚙️ Tune System Performance <a name="tune-system-performance"></a>

### What Does it Mean to Tune System Performance?

Tuning system performance involves optimizing system settings and configurations to enhance efficiency. ⚡

### Optimize System Performance

Select a tuning profile managed by the **tuned** daemon to adapt system performance based on workload.

### Prioritize or De-prioritize Processes

The **nice** and **renice** commands adjust process priority:

- **Nice**: Start a process with a given priority.
- **Renice**: Change the priority of an already running process.

![Tuning Process](https://via.placeholder.com/600x300?text=Tuning+Process+Graph)

### What is Tuned?

**Tuned** is a daemon that dynamically adapts system settings based on defined profiles.

### Common Tuned Profiles Table

| **Profile**       | **Description**                        |
| ----------------- | -------------------------------------- |
| **throughput**    | Optimize for throughput                |
| **latency**       | Reduce latency for real-time apps      |
| **virtual-guest** | Optimize settings for virtual machines |

### Installation and Configuration

To install and configure **tuned**, use:

```bash
sudo yum install tuned
sudo systemctl start tuned
sudo systemctl enable tuned
```

### Script for Common Usage

```bash
#!/bin/bash
# Install tuned if not present
if ! command -v tuned &> /dev/null; then
    sudo yum install tuned -y
fi

# Start tuned service
sudo systemctl start tuned
```

### Nice and Renice

- **Nice Levels**: Ranges from `-20` (highest) to `19` (lowest). 📈
- **PRI**: Actual priority used by the kernel, varies from `0` to `139`.

### Common Options for Nice

| **Option** | **Description**                                  |
| ---------- | ------------------------------------------------ |
| `-n`       | Specify the nice value                           |
| `command`  | The command to run with the specified nice value |

---

## 📦 Run Containers - Podman <a name="run-containers-podman"></a>

### What are Containers?

Containers package applications and their dependencies into a single unit that can run consistently on any system. 📦

### Container Software

- **Docker**: The most popular containerization tool.
- **Podman**: A daemonless container engine. 🚀

### What is Podman?

**Podman** allows users to manage containers without needing a daemon. It's compatible with Docker commands, making it easy to switch.

![Container Management](https://via.placeholder.com/600x300?text=Container+Management+Graph)

### Common Podman Use Case

To run a simple web server in a container:

```bash
podman run -d -p 8080:80 nginx
```

### Podman Options Table

| **Option** | **Description**                                  |
| ---------- | ------------------------------------------------ |
| `-d`       | Run container in detached mode                   |
| `-p`       | Publish a container's port to the host           |
| `--rm`     | Automatically remove the container when it exits |
| `-it`      | Run container interactively with a terminal      |

---

## 🛠️ Kickstart - Automate Linux Installation <a name="kickstart"></a>

### What is Kickstart?

Kickstart automates Linux installations without user intervention, allowing for consistent setup across systems. 🤖

### Purpose of Kickstart

Streamline the installation process, including configuration of language, time zone, partitioning, and package selection.

### How to Use Kickstart

1. Choose a kickstart server and create/edit a kickstart file.
2. Make the kickstart file available on a network location.
3. Provide the installation source.
4. Prepare boot media for the client.
5. Start the kickstart installation.

### Kickstart File Usage

You can create a kickstart file during the initial installation with `anaconda-ks.cfg`.

### Step-by-Step Procedure for Kickstart

1. Identify the server.
2. Take a snapshot of the server.
3. Install kickstart configuration.
4. Define parameters or use defaults in the kickstart file.
5. Ensure `httpd` is installed.
6. Copy the kickstart file to the `httpd` directory.
7. Create a new VM and set the network adapter to bridged mode.
8. Boot with the command: `linux ks=http://192.168.1.x/anaconda-ks.cfg`

![Kickstart Installation](https://via.placeholder.com/600x300?text=Kickstart+Installation+Graph)

---

## 🌐 DHCP Server <a name="dhcp-server"></a>

### What is a DHCP Server?

A DHCP (Dynamic Host Configuration Protocol) server automatically assigns IP addresses and other network configurations to devices on a network. 📡

### How DHCP Works

DHCP servers manage a pool of IP addresses and lease them to clients as they connect to the network.

### Installing and Configuring DHCP

1. Assign a static IP to the DHCP server.
2. Use `nmtui` to configure network settings.
3. Install the DHCP server package:
   ```bash
   sudo apt-get install isc-dhcp-server
   ```
4. Edit the configuration file at `/etc/dhcp/dhcp.conf`.

### Common DHCP Configuration Example

```bash
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.10 192.168.1.50;
    option routers 192.168.1.1;
    option subnet-mask 255.255.255.0;
}
```

### Switching DHCP Service from Router to Server

1. Disable DHCP on the router.
2. Configure the router to point to the new DHCP server's IP.

![DHCP Process](https://via.placeholder.com/600x300?text=DHCP+Process+Graph)

### Automation Script for DHCP Setup

```bash
#!/bin/bash
# Install DHCP server
sudo apt-get install isc-dhcp-server -y

# Start DHCP service
sudo systemctl start isc-dhcp-server
sudo systemctl enable isc-dhcp-server
```

---
