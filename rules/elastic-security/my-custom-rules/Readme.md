# Security Detection Rules

This repository contains a curated collection of detection rules for Elastic Security, auditd, Suricata, and ClamAV, focused on monitoring and protecting Linux environments.

## Frameworks & Methodology

All detection rules in this repository were developed using the [Alerting and Detection Strategy (ADS) Framework)](https://github.com/palantir/alerting-detection-strategy-framework) by Palantir.
The ADS Framework provides a structured, peer-reviewed approach to detection engineering, ensuring that every alert is:

- Clearly documented (goal, context, assumptions, false positives, validation, response, etc.)
- Mapped to relevant MITRE ATT&CK tactics and techniques
- Validated for durability and operational value before deployment

This methodology helps ensure that detection rules are actionable, transparent, and relevant for real-world adversary behavior and blue team workflows, while minimizing alert fatigue and improving overall detection quality.

## Structure

- Each detection rule is stored in its own folder.
- Each folder contains:
    - `rule.ndjson` – the exported detection rule (for import into Kibana)
    - `README.md` – detailed documentation for the rule (description, tactics, techniques, investigation steps, etc.)

## Quick Start

1. Browse to the rule folder you are interested in.
2. Read the `README.md` for details about the rule.
3. Import the `rule.ndjson` file into Kibana (Stack Management → Detection Rules → Import).
4. Adjust the rule as needed for your environment.

## Requirements

- Elastic Stack (Kibana/SIEM) 8.x or newer recommended
- Linux hosts with auditd, Suricata, and/or ClamAV as needed

## References

- [Elastic Security Documentation](https://www.elastic.co/guide/en/security/current/index.html)
- [MITRE ATT&CK](https://attack.mitre.org/)
- [Suricata Documentation](https://docs.suricata.io/)
- [ClamAV Documentation](https://docs.clamav.net/)
- [auditd Documentation (man7.org)](https://man7.org/linux/man-pages/man8/auditd.8.html)
- [Red Hat: Auditing the system](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/security_hardening/auditing-the-system_security-hardening)
- [SUSE: Understanding Linux audit](https://documentation.suse.com/sles/15-SP6/html/SLES-all/cha-audit-comp.html)
- [ADS Framework (Palantir)](https://github.com/palantir/alerting-detection-strategy-framework)

---
