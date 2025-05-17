# Privilege Escalation via SUID/SGID Binaries

**Description:**  
Detects the creation, modification, or execution of files with the SUID (Set User ID) or SGID (Set Group ID) permission bits set. Attackers may leverage SUID/SGID binaries to escalate privileges or maintain persistence on a compromised system.

**Tactics:**  
- Privilege Escalation ([MITRE ATT&CK TA0004](https://attack.mitre.org/tactics/TA0004/))
- Persistence ([MITRE ATT&CK TA0003](https://attack.mitre.org/tactics/TA0003/))

**Techniques:**  
- Abuse Elevation Control Mechanism ([T1548](https://attack.mitre.org/techniques/T1548/))
- Modify Existing Service ([T1031](https://attack.mitre.org/techniques/T1031/))

**Severity:**  
high

**Risk Score:**  
80

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Privilege Escalation`, `Tactic: Persistence`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate system administration activities, such as installing or updating trusted software packages.
- Authorized scripts or processes that temporarily set SUID/SGID bits for operational reasons.

**References:**  
- [GTFOBins: SUID](https://gtfobins.github.io/#+suid)

**Investigation Steps:**  
- Review the file paths and names of binaries with SUID/SGID bits set or modified.
- Identify the user and process responsible for the change.
- Check if the binary is a known and trusted application or a suspicious/unknown file.
- Determine if the change was authorized by system administrators.
- Investigate recent executions of SUID/SGID binaries for signs of privilege escalation.
- Remove unauthorized SUID/SGID bits and remediate as necessary.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
