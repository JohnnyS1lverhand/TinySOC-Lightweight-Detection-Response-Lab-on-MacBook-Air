# ClamAV

**ClamAV** is an open-source antivirus engine designed to detect trojans, viruses, malware, and other malicious threats. It is widely used for scanning files, emails, and archives for malware, and provides fast signature updates and flexible integration options.

---

## Features

- **File and archive scanning** (ZIP, RAR, 7z, tar, gzip, bzip2, etc.)
- **Detection of millions of viruses, trojans, worms, and malware**
- **On-access real-time protection** (Linux only, via ClamD and ClamOnAcc)
- **Automatic signature updates** with `freshclam`
- **Optimized scanning speed**
- **Command-line tools for integration and automation**
- **Cross-platform support:** Linux, Windows, macOS
- **Email gateway scanning**
- **Signed signature databases for security**

---

## Installation

1. **Update package index:**
    ```
    sudo apt-get update
    ```

2. **Install ClamAV and the daemon:**
    ```
    sudo apt-get install clamav clamav-daemon -y
    ```

3. **Check installed version:**
    ```
    clamscan --version
    ```

4. **Update virus signatures:**
    ```
    sudo systemctl stop clamav-freshclam
    sudo freshclam
    sudo systemctl start clamav-freshclam
    ```

5. **Enable and start the ClamAV daemon:**
    ```
    sudo systemctl enable clamav-daemon
    sudo systemctl start clamav-daemon
    sudo systemctl status clamav-daemon
    ```
---

## Configuration

All main configuration files are located in `/etc/clamav`:

- **clamd.conf** – ClamAV daemon settings (scanning, sockets, logging)
- **freshclam.conf** – Signature update settings

### Example: freshclam Configuration

Edit `/etc/clamav/freshclam.conf` to set update mirrors and frequency.  
After changes, restart the update service:

```
sudo systemctl restart clamav-freshclam
```

## Integration with Kibana:
After installation, you can use the custom script provided in this repository for logging ClamAV events: [script](/scripts/ClamAV)

Once you have activated the script, you can create an integration using Custom Logs in Kibana.

![image](https://github.com/user-attachments/assets/64255d51-0bfb-4ffe-90e2-2d27b3b2d721)

> **Note:**  
> For Windows and macOS, installation steps differ. Refer to the [official documentation](https://docs.clamav.net/) for details.
