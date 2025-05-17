# SUID/SGID Binary Enumeration Detection

**Description:**  
Detects the enumeration or listing of files with SUID (Set User ID) or SGID (Set Group ID) permissions. Attackers often search for such binaries to identify potential privilege escalation vectors on a compromised system.

**Tactics:**  
- Discovery ([MITRE ATT&CK TA0007](https://attack.mitre.org/tactics/TA0007/))
- Privilege Escalation ([MITRE ATT&CK TA0004](https://attack.mitre.org/tactics/TA0004/))

**Techniques:**  
- File and Directory Discovery ([T1083](https://attack.mitre.org/techniques/T1083/))
- Permission Groups Discovery ([T1069](https://attack.mitre.org/techniques/T1069/))

**Severity:**  
medium

**Risk Score:**  
55

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Discovery`, `Tactic: Privilege Escalation`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- System administrators or security tools performing routine security audits or compliance checks.
- Automated vulnerability scanners or configuration management tools.

**References:**  
- [GTFOBins: SUID](https://gtfobins.github.io/#+suid)

**Investigation Steps:**  
- Review the process and user that performed the enumeration.
- Check command-line arguments for suspicious enumeration commands (e.g., `find / -perm -4000 -type f`).
- Correlate with other activity from the same user or process, such as attempts to exploit discovered binaries.
- Determine if the enumeration was part of authorized security operations.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
