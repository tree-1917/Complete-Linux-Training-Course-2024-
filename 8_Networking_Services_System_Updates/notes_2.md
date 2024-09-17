# Networking Services System Updates

> Outline

- [ ]
- [ ]

---

## Content

### 156. DNS - Download, Install and Configure (Domain Name Systems)

- What is **DNS** ?
- How to install and Configure **DNS** ?
- How to create a **DNS** Using Shell Script ?
- What are Types of Hostname ?
  - PTR Record **IP to Hostname**
  - A Record **Hostname to IP**
  - CNAME Record **Hostname to Hostname**
- What are Types of Files ?
  - /etc/named.conf
  - /var/named
- what are Types of Service ?
  - Systemctl restart named

### 157. Hostname or IP Lookup (**nslookup** and **dig**)

- What means **Hostname** or **IP Lookup** ?
- How to Use **nslookup** and **dig** ?

### 158. Network Time Protocol (NTP)

- What is **NTP** ?
- What is **Purpose** ?
- What is **File** ?
  - /etc/ntp.conf
- What is **Service** ?
  - systmctl restart ntpq
- What is **Commond** ?
  - ntpq

### 159. chronyd (New Version of NTP)

- What is **Chronyd** ?
- What is **Purpose** ?
- What is **package** ?
- What is **Configureation file**?
  - /etc/chronyd.conf
- What is **log file** ?
  - /var/log/chrony
- What is **service** ?
- What is **Program** ?
  - chronyc

### 160. New System Utility Command (timedatectl)

- what **timedatectl** ?
  - it replace for old **date** command
  - it **sychronizes** the ime with ntp server as well :
    - you can either use **chronyd** or **ntpd** and makt ntp setting in timedatectl as yes
    - or you can use **systemd-timesynod** daemon to synchroize time which is a replacement for **ntpd** and **chronyd**
- Make a lab contains the common usage for **timedatectl**
- summary this lab in only on shell file
  - add to lab :
    - to check time status
    - to view all available time zones
    - to set the time zone
    - to set date
    - to set date and time
    - to start automatic time synchronization with a remote ntp server

### 161. Mail Transfer Agent

- What is Mail Servers ?
- What is Usage of **Mail** Servers ?
  - Storage
  - Processing
  - Delivery of emails
- What Linux Mail Server ?
  - Postfix
    - Secure MTA
    - Simplicty
  - Sendmail
    - Configureable
    - Complex
  - Exim
    - Flexible
    - Configurable
  - Qmail
    - Secure
    - Reliable
  - OpenSTMPD
    - Lightweight
    - Easy to configure
  - DovEcot
    - IMAP
    - POP3
    - performace
    - securtiy
  - Courier
    - IMAP
    - POP3
  - Zimbra
    - Collaberation suite
  - SpamAssanin
  - clamAv
- How to install Postfix and configure ?
- What files for Postfix ?
  - /etc/postfix/
  - /etc/postfix/main.cf.
  - systemctl restart postfix
  - don't 'd' -> **httpd**
  - mail -s option
- What **S-nail** Package ?
  - postfix
    - handles emails no server
  - s-nail
    - write and send email on terminal
  - What is mail relay server ?

### 162. Web Server (Apache - HTTP)

- What Mean **Web Server** ?
- what is **Purpose** for Web Server Webpages ?
- How to install and Configuration **Apache** and **HTTP** ?
  - Httpd
  - files :
    - /etc/http/conf/httpd.conf
    - /var/www/html/index.html
  - service :
    - systemctl restart httpd
    - systemctl enable httpd
  - log files :
    - /var/log/httpd
- Make a lab of common Use for **Apache** and **HTTP**
- Make a table of common option for **Apache** and **HTTP** ?

### 162. Central Logger (rsyslog)

- What Mean **Central Logger (rsyslog)** ?
- What Purpose for This Server ?
  - Service or package name = resyslog
  - config file = /etc/rsyslog.conf
- service :
  - systemctl restart rsyslog
  - systemctl enable rsyslog
- Why Need **Central Logger** ?

### 163. Securing Linux Machine (OS Hardening)

- What mean **Linux Hardening** ?
  - User Account
  - Remove un-wanted package
  - stop un-used Service
  - Check on Listening Ports
  - Secure SSH config
  - Enable firewall **iptables/firewalld**
  - Enable SElinux
  - Change Listening Services Port Numbers
  - Keep your Os up to data **Securing patch**

### 165. OpenLDAP Installation

- What **OpenLDAP** ?
- How to **OpenLDAP** install and config?
- OpenLDAP Service
  - Slapd
- Start or stop the service
  - systemctl start slapd
  - systemctl enable slapd
- Configuration files :
  - `/etc/openldap/slapd.d`

### 166. Tracing Network Traffic (traceroute)

- What Mean **Tracing Network Traffic** ?
- Make a script to find the points in routes which made error in path ?
- Make a Common Using for **traceroute** ?

### 167. How to open Image File through Command Line

- What is Image File ?
- How to Open Image File Through Command Line ?

### 168. Configure and Secure SSH

- What is **SSH** ?
  - SHH stands for Secure Shell
    - Provides you with an interface to the linux system , it's takes in your commands and translate them to kernel to manage hardware
- How to install **SSH** and How Configure ? **22**
- How to Configure ?
  - Become
  - /etc/ssh/sshd_config
  - clientaliaveinterval 600
  - clientalivecountmax 0
  - # systemctl restart sshd
- The idle timeout interval in seconds. once the interval has passed the idle user will be automattically logged out .
- Disable root login
  - Become root
  - Edit your /etc/ssh/sshd_config
  - premitRootLongin on
  - # systemctl
- Disable Empty Passwords
  - Bcome root
  - /etc/ssh/sshd_config
  - previmitepty
- Limit User's SSH Access
  - ...
  - AllowUsers user1 user2
  - ...
- Use a different port s
  - ...
  - port 22
  - ...
- SSh-keys - Access Remote Server without password

### 169. SSH-Keys - Access Remote Server without Password

- What Mean **SSH-Keys** ?
- Why to access a remote machine ?
  - Repetitive logins
  - Automation through scripts
- How to use **SSH-keys** ?
  - keys Generated
- How to config **SSH-keys** ?
