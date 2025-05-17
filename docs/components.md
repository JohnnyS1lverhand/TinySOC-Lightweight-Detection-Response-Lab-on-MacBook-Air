# Components Description

## Elastic Stack

- **Elasticsearch:** Stores and indexes all collected logs and events.
- **Kibana:** Visualization and dashboarding for security analytics.

## Elastic Agent (Standalone mode)

- Unified agent for collecting logs, metrics, and security events from endpoints.
- Configured locally via YAML files (no Fleet management).

## auditd

- Linux Audit Daemon for tracking system calls, user actions, and security-relevant events.

## Suricata

- Network IDS/IPS for monitoring and analyzing network traffic.

## ClamAV

- Open-source antivirus engine for scanning files and detecting malware.

## Custom Scripts

- Additional log parsing, enrichment, or integration scripts as needed.

See [data-flow.md](./data-flow.md) for how these components interact.
