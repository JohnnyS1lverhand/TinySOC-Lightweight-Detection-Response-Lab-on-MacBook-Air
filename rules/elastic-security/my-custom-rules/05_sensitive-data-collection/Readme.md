# Sensitive Data Collection Detection

**Description:**  
Detects attempts to access or collect sensitive files on the host, such as password databases, SSH private keys, configuration files, or confidential business documents. Attackers may gather such files as part of the data collection phase before exfiltration or privilege escalation.

**Tactics:**  
- Collection ([MITRE ATT&CK TA0009](https://attack.mitre.org/tactics/TA0009/))

**Techniques:**  
- Data from Local System ([T1005](https://attack.mitre.org/techniques/T1005/))
- Credentials from Password Stores ([T1555](https://attack.mitre.org/techniques/T1555/))

**Severity:**  
medium

**Risk Score:**  
60

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Collection`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate system backups or administrative scripts accessing sensitive files.
- Security scans or compliance checks performed by authorized personnel.
- Routine access by privileged users as part of normal operations.

**References:**  
- [MITRE ATT&CK: Data from Local System](https://attack.mitre.org/techniques/T1005/)
- [MITRE ATT&CK: Credentials from Password Stores](https://attack.mitre.org/techniques/T1555/)

**Investigation Steps:**  
- Identify the user and process accessing the sensitive files.
- Review the list of files accessed and determine their sensitivity.
- Correlate with other suspicious activity (e.g., data exfiltration, privilege escalation).
- Check if the access was performed by an authorized user or process.
- Investigate the timing and frequency of access to determine if it aligns with normal business operations.

**Rule File:**  
[rule.ndjson](./rule.ndjson)

