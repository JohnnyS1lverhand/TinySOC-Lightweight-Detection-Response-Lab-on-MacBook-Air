
# Internal SSH Brute Force Attempt Detection

**Description:**  
Detects multiple failed SSH login attempts originating from internal IP addresses within a short period. This may indicate brute-force attacks or compromised hosts attempting lateral movement within the network.

**Tactics:**  
- Lateral Movement ([MITRE ATT&CK TA0008](https://attack.mitre.org/tactics/TA0008/))

**Techniques:**  
- Brute Force ([T1110](https://attack.mitre.org/techniques/T1110/))
- Remote Services ([T1021](https://attack.mitre.org/techniques/T1021/))

**Severity:**  
high

**Risk Score:**  
75

**Data Source:**  
auditd

**Tags:**  
`Domain: Network`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Lateral Movement`, `Technique: Brute Force`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- System administrators performing legitimate password testing or troubleshooting.
- Automated monitoring or backup scripts with outdated or incorrect credentials.
- Users who have forgotten their passwords and repeatedly attempt to log in.

**References:**  
- [Elastic Security Labs: Detecting SSH Brute Force Attacks](https://www.elastic.co/security-labs/detecting-ssh-brute-force-attacks)

**Investigation Steps:**  
- Review the source and destination IP addresses involved in the failed login attempts.
- Check the frequency and timing of failed attempts to determine if they are automated.
- Correlate with other security events (e.g., successful logins, privilege escalation).
- Determine if the source IP is a known and trusted system.
- Investigate whether any accounts were successfully compromised following the brute-force attempts.
- Monitor for subsequent suspicious activity from affected accounts or hosts.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
