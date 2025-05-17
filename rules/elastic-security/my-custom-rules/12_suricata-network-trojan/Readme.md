# Suricata Network Trojan Detection

**Description:**  
Detects network traffic indicative of Trojan malware activity using Suricata IDS/IPS alerts. This rule focuses on identifying suspicious network connections, command and control (C2) communications, and known Trojan behaviors that may indicate a compromised host communicating with an attacker-controlled server.

**Tactics:**  
- Command and Control ([MITRE ATT&CK TA0011](https://attack.mitre.org/tactics/TA0011/))
- Execution ([MITRE ATT&CK TA0002](https://attack.mitre.org/tactics/TA0002/))

**Techniques:**  
- Application Layer Protocol ([T1071](https://attack.mitre.org/techniques/T1071/))
- Remote Access Tool ([T1219](https://attack.mitre.org/techniques/T1219/))
- Standard Application Layer Protocol ([T1071.001](https://attack.mitre.org/techniques/T1071/001/))

**Severity:**  
high

**Risk Score:**  
85

**Data Source:**  
suricata

**Tags:**  
`Domain: Network`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Command and Control`, `Data Source: Suricata`, `Type: Custom`

**False Positives:**  
- Legitimate applications communicating over standard protocols that may resemble Trojan traffic.
- Network scanning or penetration testing activities.
- Misconfigured or experimental network services.

**References:**  
- [Suricata Documentation](https://docs.suricata.io/)

**Investigation Steps:**  
- Analyze the source and destination IP addresses and ports involved in the suspicious traffic.
- Review Suricata alerts for details on the nature of the detected traffic.
- Correlate network events with host-based logs to identify the originating process or user.
- Check for persistence mechanisms or additional malware on the affected host.
- Isolate compromised systems to prevent further spread or data exfiltration.

**Rule File:**  
[rule.ndjson](./rule.ndjson)

