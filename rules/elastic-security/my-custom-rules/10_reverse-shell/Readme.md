# Reverse Shell Detection

**Description:**  
Detects the execution of commands or processes commonly used to establish reverse shells. Reverse shells allow attackers to gain remote control over a compromised system by initiating outbound connections to an external host, bypassing inbound firewall restrictions.

**Tactics:**  
- Command and Control ([MITRE ATT&CK TA0011](https://attack.mitre.org/tactics/TA0011/))
- Execution ([MITRE ATT&CK TA0002](https://attack.mitre.org/tactics/TA0002/))

**Techniques:**  
- Remote Access Tool ([T1219](https://attack.mitre.org/techniques/T1219/))
- Command and Scripting Interpreter ([T1059](https://attack.mitre.org/techniques/T1059/))

**Severity:**  
critical

**Risk Score:**  
90

**Data Source:**  
auditd, suricata

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Command and Control`, `Tactic: Execution`, `Data Source: Auditd`, `Data Source: Suricata`, `Type: Custom`

**False Positives:**  
- System administrators or security teams testing reverse shell detection in a controlled environment.
- Automated penetration testing or red team exercises.

**References:**  
- [GTFOBins: Reverse Shell](https://gtfobins.github.io/#+reverse%20shell)
- [Elastic Security Labs: Detecting Reverse Shells](https://www.elastic.co/security-labs/detecting-reverse-shells)

**Investigation Steps:**  
- Review the process command line and arguments to confirm reverse shell activity.
- Identify the source and destination IP addresses and ports involved in the connection.
- Determine the user and process context that initiated the shell.
- Correlate with network logs (e.g., Suricata alerts) for evidence of outbound connections.
- Isolate the affected host and perform a full forensic investigation.
- Check for persistence mechanisms or additional malware on the system.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
