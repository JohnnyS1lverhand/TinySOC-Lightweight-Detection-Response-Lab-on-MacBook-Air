# Impact: Destructive Actions Detection

**Description:**  
Detects potentially destructive actions on the system, such as mass deletion of files, wiping of log files, or commands that could disrupt system availability and integrity. Attackers may use such techniques to damage systems, erase evidence, or disrupt business operations.

**Tactics:**  
- Impact ([MITRE ATT&CK TA0040](https://attack.mitre.org/tactics/TA0040/))
- Defense Evasion ([MITRE ATT&CK TA0005](https://attack.mitre.org/tactics/TA0005/))

**Techniques:**  
- Data Destruction ([T1485](https://attack.mitre.org/techniques/T1485/))
- Inhibit System Recovery ([T1490](https://attack.mitre.org/techniques/T1490/))
- Indicator Removal on Host ([T1070](https://attack.mitre.org/techniques/T1070/))

**Severity:**  
critical

**Risk Score:**  
95

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Impact`, `Tactic: Defense Evasion`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate system maintenance, such as log rotation or cleanup scripts.
- Administrators performing authorized file deletions or system resets.
- Automated backup or archival processes that remove old files.

**References:**  
- [MITRE ATT&CK: Data Destruction](https://attack.mitre.org/techniques/T1485/)
- [MITRE ATT&CK: Inhibit System Recovery](https://attack.mitre.org/techniques/T1490/)
- [MITRE ATT&CK: Indicator Removal on Host](https://attack.mitre.org/techniques/T1070/)

**Investigation Steps:**  
- Identify the user and process responsible for the destructive action.
- Review command line arguments and affected files or directories.
- Correlate with other suspicious activity or alerts (e.g., privilege escalation, persistence).
- Determine if the action was authorized or part of normal operations.
- Restore affected files from backups if possible.
- Conduct a full forensic investigation to assess the scope and impact.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
