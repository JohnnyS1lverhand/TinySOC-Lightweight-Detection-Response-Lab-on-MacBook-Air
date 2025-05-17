# Use Cases

This document outlines practical scenarios and threat detection use cases covered by the TinySOC lab.

## Example Use Cases

### 1. Unauthorized User Creation

- Detects creation of new user accounts or privilege escalation attempts using auditd logs.

### 2. SSH Brute Force Attack

- Identifies multiple failed SSH login attempts from internal or external sources using auditd and Suricata data.

### 3. Malware Detection

- Alerts on files detected as malicious by ClamAV and their execution on endpoints.

### 4. Data Exfiltration

- Detects suspicious outbound data transfers or access to sensitive files using Suricata and auditd.

### 5. Trace Removal

- Monitors for attempts to delete or alter log files, indicating possible attacker cleanup activity.

## How to Extend

- Add new detection rules for emerging threats.
- Integrate additional data sources (e.g., Windows Event Logs, cloud logs).
- Update Elastic Agent YAML configuration to collect new log sources.

Refer to the [rules/](../rules/elastic-security) directory for a full list of detection rules implemented in this lab.
