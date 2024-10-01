# Networking Services & System Updates 🌐

> **Outline**

- [156. DNS - Download, Install and Configure](#156-dns---download-install-and-configure)
- [157. Hostname or IP Lookup (**nslookup** and **dig**)](#157-hostname-or-ip-lookup-nslookup-and-dig)
- [158. Network Time Protocol (NTP)](#158-network-time-protocol-ntp)
- [159. Chronyd (New Version of NTP)](#159-chronyd-new-version-of-ntp)
- [160. New System Utility Command (timedatectl)](#160-new-system-utility-command-timedatectl)
- [161. Mail Transfer Agent](#161-mail-transfer-agent)
- [162. Web Server (Apache - HTTP)](#162-web-server-apache---http)
- [162. Central Logger (rsyslog)](#162-central-logger-rsyslog)
- [163. Securing Linux Machine (OS Hardening)](#163-securing-linux-machine-os-hardening)
- [165. OpenLDAP Installation](#165-openldap-installation)
- [166. Tracing Network Traffic (traceroute)](#166-tracing-network-traffic-traceroute)
- [167. How to Open Image File through Command Line](#167-how-to-open-image-file-through-command-line)
- [168. Configure and Secure SSH](#168-configure-and-secure-ssh)
- [169. SSH-Keys - Access Remote Server without Password](#169-ssh-keys---access-remote-server-without-password)
- [170. Linux Web-Based Administration (cockpit)](#170-linux-web-based-administration-cockpit)

---

## 156. DNS - Download, Install and Configure (Domain Name Systems) 🕵️‍♂️

### What is **DNS**?

**DNS (Domain Name System)** translates human-readable domain names (like www.example.com) into IP addresses (like 192.0.2.1), allowing browsers to locate and access websites.

### How to Install and Configure **DNS**?

1. **Install DNS Server:**

   ```bash
   sudo apt-get update
   sudo apt-get install bind9
   ```

2. **Configure DNS Server:**

   Edit the main configuration file `/etc/bind/named.conf` and zone files:

   - **/etc/bind/named.conf**: Main configuration.
   - **/var/cache/bind/db.local**: Local DNS records.

3. **Restart DNS Service:**

   ```bash
   sudo systemctl restart bind9
   ```

### How to Create a **DNS** Using Shell Script? 🖥️

```bash
#!/bin/bash

# Install Bind9
sudo apt-get update
sudo apt-get install -y bind9

# Create a basic DNS zone configuration
cat <<EOF | sudo tee /etc/bind/named.conf.local
zone "example.com" {
    type master;
    file "/etc/bind/zones/db.example.com";
};
EOF

# Create the zone file
sudo mkdir -p /etc/bind/zones
cat <<EOF | sudo tee /etc/bind/zones/db.example.com
\$TTL 86400
@   IN  SOA example.com. root.example.com. (
            1   ; Serial
       3600   ; Refresh
        1800   ; Retry
      1209600   ; Expire
        86400 ) ; Negative Cache TTL
;
@   IN  NS  ns.example.com.
@   IN  A   192.0.2.1
ns  IN  A   192.0.2.1
EOF

# Restart Bind9 to apply changes
sudo systemctl restart bind9
```

### What are Types of Hostname? 🔍

- **PTR Record**: Maps an IP address to a hostname.
- **A Record**: Maps a hostname to an IP address.
- **CNAME Record**: Maps a hostname to another hostname.

### What are Types of Files?

- **/etc/bind/named.conf**: Main configuration file.
- **/var/cache/bind/**: Default location for zone files.

### What are Types of Service?

- **Systemctl Restart Named:**

  ```bash
  sudo systemctl restart bind9
  ```

---

## 157. Hostname or IP Lookup (**nslookup** and **dig**) 🌍

### What Means **Hostname** or **IP Lookup**?

Hostname or IP lookup involves querying DNS to find the IP address associated with a hostname or vice versa.

### How to Use **nslookup** and **dig**? 📡

1. **Using `nslookup`:**

   - To find the IP address of a hostname:

     ```bash
     nslookup www.example.com
     ```

   - To find the hostname of an IP address:
     ```bash
     nslookup 192.0.2.1
     ```

2. **Using `dig`:**

   - To find the IP address of a hostname:

     ```bash
     dig www.example.com
     ```

   - To find the hostname of an IP address:
     ```bash
     dig -x 192.0.2.1
     ```

---

## 158. Network Time Protocol (NTP) ⏰

### What is **NTP**?

**NTP (Network Time Protocol)** is used to synchronize the clocks of computers over a network.

### What is the **Purpose**?

The primary purpose of NTP is to ensure that all devices on a network have the same time, which is crucial for time-sensitive applications.

### What is the **File**?

- **/etc/ntp.conf**: Configuration file for NTP.

### What is the **Service**?

- **Systemctl Restart ntpq:**

  ```bash
  sudo systemctl restart ntp
  ```

### What is the **Command**?

- **ntpq**: Command-line utility to query NTP servers.

  ```bash
  ntpq -p
  ```

---

## 159. Chronyd (New Version of NTP) 🕒

### What is **Chronyd**?

**Chronyd** is a daemon that is part of the `chrony` suite, designed for synchronizing the system clock with NTP servers. It is an alternative to `ntpd`.

### What is the **Purpose**?

Chronyd is used to keep the system clock synchronized with NTP servers and is particularly effective in systems that are frequently disconnected from the network.

### What is the **Package**?

- **chrony**: The package that includes Chronyd.

### What is the **Configuration File**?

- **/etc/chrony/chronyd.conf**: Configuration file for Chronyd.

### What is the **Log File**?

- **/var/log/chrony**: Log file for Chronyd activities.

### What is the **Service**?

- **Systemctl Restart chronyd:**

  ```bash
  sudo systemctl restart chronyd
  ```

### What is the **Program**?

- **chronyc**: Command-line tool to monitor and control Chronyd.

  ```bash
  chronyc tracking
  ```

---

## 160. New System Utility Command (timedatectl) 🕑

### What is **timedatectl**?

**timedatectl** is a command-line utility for managing date and time settings on a Linux system. It replaces the old `date` command and integrates with `systemd`.

- **Synchronizes** time with NTP servers:
  - Use **chronyd** or **ntpd** for synchronization.
  - Or use **systemd-timesyncd** for time synchronization.

### Make a Lab for Common Usage of **timedatectl** 🔬

Here’s a script summarizing common tasks with **timedatectl**:

```bash
#!/bin/bash

# Check time status
timedatectl status

# View all available time zones
timedatectl list-timezones

# Set the time zone
sudo timedatectl set-timezone <Timezone>

# Set the date
sudo timedatectl set-date "YYYY-MM-DD"

# Set the date and time
sudo timedatectl set-time "YYYY-MM-DD HH:MM:SS"

# Start automatic time synchronization with a remote NTP server
sudo timedatectl set-ntp true
```

---

## 161. Mail Transfer Agent 📧

### What are Mail Servers?

**Mail Servers** manage the storage, processing, and delivery of emails. They play a crucial role in sending and receiving messages across networks.

### What is the **Usage** of Mail Servers?

- **Storage**: Keeps email messages until they are retrieved by the recipient.
- **Processing**: Handles the routing and processing of emails.
- **Delivery**: Sends emails to the recipient's mail server.

### What Linux Mail Servers are Available?

- **Postfix**: Secure, simple to configure.
- **Sendmail**: Highly configurable, complex.
- **Exim**: Flexible and configurable.
- **Qmail**: Secure and reliable.
- **OpenSMTPD**: Lightweight and easy to configure.
- **Dovecot**: IMAP and POP3 server, known for performance and security.
- **Courier**: IMAP and POP3 server.
- **Zimbra**: Collaboration suite.
- **SpamAssassin**: Spam filtering

.

- **ClamAV**: Antivirus software for email.

### How to Install and Configure Postfix?

1. **Install Postfix:**

   ```bash
   sudo apt-get update
   sudo apt-get install postfix
   ```

2. **Configure Postfix:**

   - Edit `/etc/postfix/main.cf` to configure settings.
   - Restart Postfix:

     ```bash
     sudo systemctl restart postfix
     ```

### What is **S-nail** Package?

- **Postfix**: Handles email delivery.
- **S-nail**: A command-line tool for writing and sending emails.

### What is a Mail Relay Server?

A **Mail Relay Server** forwards email messages from one server to another.

---

## 162. Web Server (Apache - HTTP) 🌐

### What is a **Web Server**?

A **Web Server** serves web pages to clients over the HTTP or HTTPS protocol.

### What is the **Purpose** for Web Server Webpages?

The purpose is to host and serve web content to users upon request.

### How to Install and Configure **Apache**?

1. **Install Apache:**

   ```bash
   sudo apt-get update
   sudo apt-get install apache2
   ```

2. **Configuration Files:**

   - **/etc/apache2/apache2.conf**: Main configuration file.
   - **/var/www/html/index.html**: Default web page.

3. **Restart Apache:**

   ```bash
   sudo systemctl restart apache2
   sudo systemctl enable apache2
   ```

4. **Log Files:**

   - **/var/log/apache2/**: Contains log files.

### Make a Lab for Common Use of **Apache** 🌟

Create a basic HTML page and set up a virtual host for testing.

### Common Options for **Apache** (Table) 📊

| Option         | Description                  |
| -------------- | ---------------------------- |
| `ServerName`   | Defines the server's name    |
| `DocumentRoot` | Specifies the document root  |
| `Listen`       | Port on which Apache listens |
| `ErrorLog`     | Path to error log file       |
| `CustomLog`    | Path to custom log file      |

---

## 162. Central Logger (rsyslog) 🗃️

### What is **Central Logger (rsyslog)**?

**rsyslog** is a flexible and reliable system for log processing.

### What is the **Purpose** for This Server?

Central logging allows for aggregation and management of logs from multiple sources.

### Service Commands:

- **Restart rsyslog:**

  ```bash
  sudo systemctl restart rsyslog
  sudo systemctl enable rsyslog
  ```

### Why Need **Central Logger**?

Central logging simplifies log management and analysis across distributed systems.

---

## 163. Securing Linux Machine (OS Hardening) 🔒

### What is **Linux Hardening**?

**Linux Hardening** involves securing the operating system by reducing its surface of vulnerability.

### Key Hardening Steps:

- **User Account Management**: Use strong passwords, and remove unused accounts.
- **Remove Unwanted Packages**: Only keep necessary software.
- **Stop Unused Services**: Disable unnecessary services.
- **Check Listening Ports**: Use `netstat` or `ss` to view open ports.
- **Secure SSH Config**: Edit `/etc/ssh/sshd_config`.
- **Enable Firewall**: Use `iptables` or `firewalld`.
- **Enable SELinux**: Configure SELinux policies.
- **Change Listening Ports**: Use non-standard ports for services.
- **Keep OS Updated**: Regularly apply security patches.

---

## 165. OpenLDAP Installation 🔑

### What is **OpenLDAP**?

**OpenLDAP** is an open-source implementation of the Lightweight Directory Access Protocol (LDAP).

### How to Install and Configure **OpenLDAP**?

1. **Install OpenLDAP:**

   ```bash
   sudo apt-get update
   sudo apt-get install slapd ldap-utils
   ```

2. **Start or Stop the Service:**

   - **Start Service:**

     ```bash
     sudo systemctl start slapd
     ```

   - **Enable Service:**

     ```bash
     sudo systemctl enable slapd
     ```

3. **Configuration Files:**

   - **/etc/ldap/slapd.d**: Directory for configuration files.

---

## 166. Tracing Network Traffic (traceroute) 🌍

### What is **Tracing Network Traffic**?

**Tracing Network Traffic** involves identifying the path taken by packets to reach their destination.

### Make a Script to Find Points in Routes with Errors

```bash
#!/bin/bash

# Perform a traceroute
traceroute $1
```

### Common Usage of **traceroute**

- Find network issues by identifying where packets are being dropped or delayed.

---

## 167. How to Open Image File through Command Line 📷

### What is an Image File?

An image file contains visual data, such as photos or graphics.

### How to Open Image File Through Command Line?

- **Using `xdg-open`:**

  ```bash
  xdg-open image.jpg
  ```

- **Using `eog` (Eye of GNOME):**

  ```bash
  eog image.jpg
  ```

---

## 168. Configure and Secure SSH 🔐

### What is **SSH**?

**SSH (Secure Shell)** provides a secure interface to manage Linux systems remotely.

### How to Install and Configure **SSH**?

1. **Install SSH:**

   ```bash
   sudo apt-get update
   sudo apt-get install openssh-server
   ```

2. **Configure SSH:**

   - **Edit `/etc/ssh/sshd_config`**:

     - Set `ClientAliveInterval` to 600.
     - Set `ClientAliveCountMax` to 0.
     - Disable root login: `PermitRootLogin no`.
     - Disable empty passwords: `PermitEmptyPasswords no`.

   - **Restart SSH Service:**

     ```bash
     sudo systemctl restart ssh
     ```

### SSH-Keys - Access Remote Server without Password 🗝️

### What are **SSH-Keys**?

**SSH-Keys** provide a secure and passwordless way to authenticate to a remote server.

### How to Use **SSH-Keys**?

1. **Generate SSH Key Pair:**

   ```bash
   ssh-keygen -t rsa
   ```

2. **Copy Public Key to Server:**

   ```bash
   ssh-copy-id user@server
   ```

3. **Access Remote Server:**

   ```bash
   ssh user@server
   ```

---

## 170. Linux Web-Based Administration (cockpit) ⚙️

### What is **Cockpit**?

**Cockpit** is a web-based interface for managing Linux systems.

### How to Use **Cockpit**?

1. **Install Cockpit:**

   ```bash
   sudo apt-get update
   sudo apt-get install cockpit
   ```

2. **Start and Enable Cockpit Service:**

   ```bash
   sudo systemctl start cockpit
   sudo systemctl enable cockpit
   ```

3. **Access Cockpit:**

   Open a web browser and navigate to `http://<your-server-ip>:9090`.

### Why Use **Cockpit**?

- Provides an easy-to-use web interface for system management tasks.
- Allows monitoring system performance, managing services, and more.

---
