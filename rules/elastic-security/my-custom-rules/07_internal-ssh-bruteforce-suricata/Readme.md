# Internal SSH Brute Force Attempt Detection (Suricata)

**Description:**  
Detects multiple failed SSH login attempts within a short timeframe, originating from internal network sources, as observed by Suricata IDS/IPS. This rule helps identify brute-force attacks or lateral movement attempts by compromised hosts within your environment.

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
suricata

**Tags:**  
`Domain: Network`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Lateral Movement`, `Technique: Brute Force`, `Data Source: Suricata`, `Type: Custom`

**False Positives:**  
- System administrators conducting legitimate password testing or troubleshooting.
- Automated monitoring or backup scripts with outdated or incorrect credentials.
- Users who have forgotten their passwords and repeatedly attempt to log in.

**References:**  
- [Suricata Documentation](https://docs.suricata.io/)

**Investigation Steps:**  
- Review Suricata alerts for the source and destination IP addresses involved in the failed SSH attempts.
- Check the frequency and timing of failed attempts to determine if they are automated.
- Correlate with host-based logs (e.g., auditd) for additional context.
- Determine if the source IP is a known and trusted system.
- Investigate whether any accounts were successfully compromised following the brute-force attempts.
- Monitor for subsequent suspicious activity from affected accounts or hosts.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
