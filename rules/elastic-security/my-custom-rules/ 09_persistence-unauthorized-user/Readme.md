# Persistence via Unauthorized User Creation

**Description:**  
Detects the creation of unauthorized user accounts or privilege escalation through user account manipulation. Attackers may add new users or modify existing accounts to maintain persistent access to a compromised system, often with elevated privileges.

**Tactics:**  
- Persistence ([MITRE ATT&CK TA0003](https://attack.mitre.org/tactics/TA0003/))
- Privilege Escalation ([MITRE ATT&CK TA0004](https://attack.mitre.org/tactics/TA0004/))

**Techniques:**  
- Create Account ([T1136](https://attack.mitre.org/techniques/T1136/))
- Modify Account ([T1098](https://attack.mitre.org/techniques/T1098/))

**Severity:**  
high

**Risk Score:**  
70

**Data Source:**  
auditd

**Tags:**  
`Domain: Endpoint`, `OS: Linux`, `Use Case: Threat Detection`, `Tactic: Persistence`, `Tactic: Privilege Escalation`, `Data Source: Auditd`, `Type: Custom`

**False Positives:**  
- Legitimate administrative activity, such as adding users for system maintenance or onboarding.
- Automated scripts for user provisioning in managed environments.

**References:**
- [Elastic Security Labs: Detecting Persistence Mechanisms](https://www.elastic.co/security-labs/primer-on-persistence-mechanisms)

**Investigation Steps:**  
- Review the username and account details involved in the event.
- Correlate with the process and user context that performed the action.
- Check if the new or modified account has elevated privileges (e.g., added to `sudoers` or `wheel` group).
- Investigate recent logins or activity from the suspicious account.
- Validate with system administrators whether the account creation or modification was authorized.

**Rule File:**  
[rule.ndjson](./rule.ndjson)
