# auditd (ARM64)

**auditd** (Audit Daemon) is the user-space component of the Linux Auditing System. It provides comprehensive auditing capabilities, enabling administrators to monitor and record system activities for security, compliance, and forensic analysis. auditd is widely used for tracking user actions, detecting unauthorized access, monitoring file changes, and ensuring compliance with standards such as PCI DSS, HIPAA, and GDPR.

---

## Features

- **Comprehensive event logging:** Tracks system calls, file accesses, logins, and configuration changes
- **Customizable audit rules:** Monitor specific files, directories, or system events
- **Real-time monitoring:** Immediate logging of security-relevant activities
- **Detailed logs:** Includes timestamps, event types, users, and more
- **Compliance support:** Helps meet regulatory requirements
- **Forensic analysis:** Detailed logs assist in investigating security incidents

---

## Installation (ARM64)

> **Note:**  
> All major Linux distributions provide ARM64 (`aarch64`) packages for auditd.  
> The installation steps are the same as for x86_64, but make sure you are on an ARM64 system.

### Debian / Ubuntu (ARM64)

1. **Update your system:**
    ```
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo reboot
    ```

2. **Install auditd and plugins:**
    ```
    sudo apt-get install auditd audispd-plugins
    ```

3. **Verify installation:**
    ```
    auditctl -v
    uname -m   # Should show 'aarch64' or 'arm64'
    ```

### RHEL / CentOS / AlmaLinux (ARM64)

1. **Update your system:**
    ```
    sudo dnf update -y
    sudo dnf upgrade -y
    sudo reboot
    ```

2. **Install auditd and libraries:**
    ```
    sudo dnf install -y audit audit-libs
    ```

3. **Verify installation:**
    ```
    auditctl -v
    uname -m   # Should show 'aarch64'
    ```

---

## Service Management

1. **Enable auditd to start on boot:**
    ```
    sudo systemctl enable auditd
    ```

2. **Start the auditd service:**
    ```
    sudo systemctl start auditd
    ```

3. **Check service status:**
    ```
    sudo systemctl status auditd
    ```

---

## Configuration

All main configuration files are located in `/etc/audit/`:

- **auditd.conf**: Main configuration file (log location, size, format, etc.)
- **rules.d/**: Directory for persistent audit rules files
- **audit.rules**: File for persistent rules (in `rules.d/` directory)

### auditd.conf Example

Edit `/etc/audit/auditd.conf` to set key parameters:

`log_file = /var/log/audit/audit.log`

`max_log_file = 8`

`log_format = ENRICHED`

After changes, restart auditd:

```
sudo systemctl restart auditd
```
---

## Audit Rules

Audit rules define what events auditd monitors. They can be:

- **Temporary:** Active until reboot (set with `auditctl`)
- **Persistent:** Survive reboots (set in `/etc/audit/rules.d/audit.rules`)

> **See the [audit.rules](/rules/auditd/audit.rules) file in this repository for the actual persistent rules configuration.**

Reload rules:
```
sudo service auditd reload
```
List active rules:
```auditctl -l```

> **Note:**  
> On ARM64, audit rules syntax and capabilities are the same as on x86_64.  
> For syscall rules, use `arch=arm64` (or `b64`) instead of `arch=x86_64`.

---

## Log Analysis

- **Default log file:** `/var/log/audit/audit.log`
- **Search logs by key:**
    ```
    sudo ausearch -i -k <your-key>
    ```
- **View logs directly:**
    ```
    sudo cat /var/log/audit/audit.log | grep <your-key>
    ```

---

**References:**  
- [auditd man page](https://man7.org/linux/man-pages/man8/auditd.8.html)  
- [Linux Audit Documentation](https://linux.die.net/man/8/auditd)  
- For ARM64-specific kernel audit support, see your distribution’s documentation.

---

auditd is now installed and ready to help you monitor, analyze, and secure your ARM64 Linux system!
