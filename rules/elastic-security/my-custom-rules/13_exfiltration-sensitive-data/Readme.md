# Sensitive Data Exfiltration Detection

**Description:**  
Detects potential exfiltration of sensitive data from the host by monitoring access to and transfer of confidential files (such as password databases, SSH keys, or business documents) to external destinations. This rule helps identify attempts to steal data via network transfers, removable media, or suspicious processes.

**Tactics:**  
- Exfiltration ([MITRE ATT&CK TA0010](https://attack.mitre.org/tactics/TA0010/))

**Techniques:**  
- Exfiltration Over Command and Control Channel ([T1041](https://attack.mitre.org/techniques/T1041/))
- Exfiltration Over Alternative Protocol ([T1048](https://attack.mitre.org/techniques/T1048/))
- Exfiltration to Cloud Storage ([T1567](https://attack.mitre.org/techniques/T1567/))

**Severity:**  
high

**Risk Score:**  
80

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Exfiltration`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate file transfers by system administrators or automated backup processes.
- Scheduled data exports to trusted cloud storage or partner systems.
- Business operations involving large file uploads (e.g., reporting, marketing).

**References:**  
- [Elastic Security Labs: Detecting Data Exfiltration](https://www.elastic.co/security-labs/detecting-data-exfiltration)

**Investigation Steps:**  
- Review the files accessed and transferred, focusing on sensitive or confidential data.
- Identify the destination IP addresses, domains, or removable devices involved.
- Correlate with user activity and process information to determine if the transfer was authorized.
- Check for unusual network protocols or destinations (e.g., unfamiliar cloud providers, foreign IPs).
- Investigate if similar activity has occurred in the past from the same user or host.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
