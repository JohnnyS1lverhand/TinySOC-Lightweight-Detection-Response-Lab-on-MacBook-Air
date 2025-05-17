# Trace Removal Detection

**Description:**  
Detects attempts to remove traces of malicious activity by deleting or altering system logs, history files, or other forensic evidence. Attackers often use these techniques to evade detection and hinder incident response investigations.

**Tactics:**  
- Defense Evasion ([MITRE ATT&CK TA0005](https://attack.mitre.org/tactics/TA0005/))
- Impact ([MITRE ATT&CK TA0040](https://attack.mitre.org/tactics/TA0040/))

**Techniques:**  
- Indicator Removal on Host ([T1070](https://attack.mitre.org/techniques/T1070/))
- File Deletion ([T1107](https://attack.mitre.org/techniques/T1107/))

**Severity:**  
high

**Risk Score:**  
85

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Defense Evasion`, `Tactic: Impact`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate system maintenance, such as log rotation or cleanup scripts executed by administrators.
- Automated compliance or backup solutions that remove old log files according to policy.

**References:**  
- [Elastic Security Labs: Detecting Trace Removal](https://www.elastic.co/security-labs/detecting-trace-removal)

**Investigation Steps:**  
- Identify the user and process responsible for log or evidence removal.
- Review command-line arguments and targeted files or directories.
- Correlate with other suspicious activity (e.g., privilege escalation, data exfiltration).
- Determine if the action was authorized or part of normal operations.
- Restore deleted logs from backups if possible.
- Conduct a full forensic investigation to assess the scope and impact.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
