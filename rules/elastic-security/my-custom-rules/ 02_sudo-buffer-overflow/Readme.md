# Sudo Heap-Based Buffer Overflow Attempt

**Description:**  
Detects attempts to exploit heap-based buffer overflow vulnerabilities in the `sudo` utility (such as CVE-2021-3156, also known as "Baron Samedit"). Successful exploitation may allow local privilege escalation to root, potentially providing attackers with complete control over the affected system.

**Tactics:**  
- Privilege Escalation ([MITRE ATT&CK TA0004](https://attack.mitre.org/tactics/TA0004/))
- Defense Evasion ([MITRE ATT&CK TA0005](https://attack.mitre.org/tactics/TA0005/))

**Techniques:**  
- Exploitation for Privilege Escalation ([T1068](https://attack.mitre.org/techniques/T1068/))
- Abuse Elevation Control Mechanism ([T1548](https://attack.mitre.org/techniques/T1548/))

**Severity:**  
critical

**Risk Score:**  
90

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Privilege Escalation`, `Tactic: Defense Evasion`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Security testing or vulnerability scanning tools intentionally triggering the vulnerability.
- System administrators running proof-of-concept exploits in a controlled environment.

**References:**  
- [CVE-2021-3156: Heap-Based Buffer Overflow in Sudo](https://www.sudo.ws/alerts/unescape_overflow.html)

**Investigation Steps:**  
- Review the command line arguments and context of the `sudo` invocation.
- Identify the user and process attempting the exploit.
- Check for any successful privilege escalation or creation of unauthorized root-level accounts.
- Verify the version of `sudo` installed and patch immediately if vulnerable.
- Search for additional signs of exploitation or persistence mechanisms deployed after the attempt.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
