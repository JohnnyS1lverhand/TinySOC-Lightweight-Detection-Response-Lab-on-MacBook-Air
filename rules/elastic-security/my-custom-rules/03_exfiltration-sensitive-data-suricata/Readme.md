# Exfiltration of Sensitive Data (Suricata)

**Description:**  
Detects potential exfiltration of sensitive data over the network using Suricata IDS/IPS alerts. This rule identifies suspicious outbound data transfers, such as large file uploads, connections to known exfiltration services, or use of uncommon protocols that may indicate data theft or unauthorized data movement from the organization.

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
suricata

**Tags:**  
`Domain: Network`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Exfiltration`, `Data Source: Suricata`, `Type: Custom`

**False Positives:**  
- Legitimate large file transfers to trusted external partners or cloud storage providers.
- Scheduled data backups to offsite or cloud locations.
- Business operations involving bulk data uploads (e.g., marketing campaigns, reporting).

**References:**  
- [Suricata Documentation](https://docs.suricata.io/)

**Investigation Steps:**  
- Analyze the destination IP addresses, domains, and protocols used in the transfer.
- Correlate Suricata alerts with user and process activity on the source host.
- Review the content or type of data being transferred, if possible.
- Check if the destination is a known or trusted entity.
- Investigate if similar activity has occurred previously from the same host or user.
- Assess whether the transfer aligns with legitimate business processes.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
