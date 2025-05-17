# Suricata

**Suricata** is a high-performance, open-source network threat detection engine, functioning as an Intrusion Detection System (IDS), Intrusion Prevention System (IPS), and Network Security Monitoring (NSM) solution. It inspects network traffic in real time, supports numerous protocols, and enables flexible rule-based detection and alerting.

---

## Features

- **IDS/IPS and NSM:** Detects, blocks, and logs network threats in real time.
- **Multi-protocol support:** HTTP, FTP, SMB, DNS, TLS, and more.
- **High performance:** Multi-threading, clustering, and hardware offload support.
- **Flexible rule management:** Supports custom and community rules.
- **Comprehensive logging:** JSON (EVE), fast.log, and SIEM integration.
- **Integration:** Works with ELK/Elastic Stack, Logstash, Kibana, and more.

---

## Installation

### Debian/Ubuntu (including ARM64)

1. **Add the official Suricata repository:**
    ```
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:oisf/suricata-stable
    sudo apt-get update
    ```

2. **Install Suricata:**
    ```
    sudo apt-get install -y suricata
    ```

3. **Verify installation:**
    ```
    suricata --build-info
    uname -m   # Should show 'aarch64' or 'arm64' on ARM systems
    ```

### RHEL/CentOS/AlmaLinux (including ARM64)

1. **Enable EPEL and OISF repositories:**
    ```
    sudo dnf install -y epel-release
    sudo dnf install -y https://copr.fedorainfracloud.org/coprs/g/suricata/suricata/repo/epel-$(rpm -E %rhel)/g-suricata-suricata-epel-$(rpm -E %rhel).repo
    ```

2. **Install Suricata:**
    ```
    sudo dnf install -y suricata
    ```

3. **Verify installation:**
    ```
    suricata --build-info
    uname -m
    ```

---

## Quick Start

1. **Identify your network interface:**
    ```
    ip addr
    ```
    (e.g., `eth0`, `enp1s0`, etc.)

2. **Edit the main configuration:**
    - File: `/etc/suricata/suricata.yaml`
    - Set `HOME_NET` to your internal network(s).
    - Under the `af-packet` section, specify your interface:
      ```
      af-packet:
        - interface: eth0 #for example
          cluster-id: 99
          cluster-type: cluster_flow
          defrag: yes
          tpacket-v3: yes
      ```

3. **Enable and start Suricata:**
    ```
    sudo systemctl enable suricata
    sudo systemctl start suricata
    sudo systemctl status suricata
    ```

---

## Rule Management

- **Update community rules:**
    ```
    sudo suricata-update
    ```
    By default, this uses Emerging Threats Open rules.

- **Rules directory:**  
  `/etc/suricata/rules/`

> **See the [custom rules](/rules/suricata/local.rules) file in this repository for your persistent rules configuration.**

### Using Custom Rules from GitHub

1. **Download the custom rules:** [local.rules](/rules/suricata/local.rules)

2. **Include the rules file in `/etc/suricata/suricata.yaml`:**
    ```
    rule-files:
      - suricata.rules
      - local.rules
    ```

3. **Test configuration:**
    ```
    sudo suricata -T -c /etc/suricata/suricata.yaml
    ```

4. **Restart Suricata:**
    ```
    sudo systemctl restart suricata
    ```
---

## Log Analysis

- **Fast log:** `/var/log/suricata/fast.log`
- **EVE JSON log:** `/var/log/suricata/eve.json`

To monitor alerts in real time:
```tail -f /var/log/suricata/fast.log```

---

## Example: IPS Mode

To run Suricata in IPS mode (inline), configure your firewall to send traffic to Suricata using NFQUEUE or use AF_PACKET inline mode.  
See the [official documentation](https://docs.suricata.io/en/latest/setting-up-ipsinline-for-linux.html) for detailed IPS setup instructions.

---

## Useful References

- [Suricata Official Documentation](https://docs.suricata.io/en/latest/)
- [Suricata YAML Configuration Guide](https://docs.suricata.io/en/latest/configuration/suricata-yaml.html)
- [Suricata Update Documentation](https://suricata-update.readthedocs.io/)

---

Suricata is now installed and ready to help you monitor, analyze, and protect your network!

