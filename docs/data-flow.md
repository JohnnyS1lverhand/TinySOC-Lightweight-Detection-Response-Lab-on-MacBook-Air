# Data Flow

This document describes how data moves through the TinySOC lab.

## 1. Event Generation

- **auditd** records system events (e.g., user logins, file access).
- **Suricata** analyzes network traffic and generates alerts.
- **ClamAV** scans for malware and logs detections.

## 2. Collection

- **Elastic Agent** (in standalone mode) collects logs from auditd, Suricata, ClamAV, and custom sources.
- Configuration is managed locally on each host via `elastic-agent.yml` and optional `inputs.d/*.yml` files.

## 3. Ingestion

- Elastic Agent sends data directly to **Elasticsearch**.

## 4. Storage & Processing

- **Elasticsearch** stores and indexes all events.
- Detection rules and analytics are applied.

## 5. Visualization

- **Kibana** provides dashboards, visualizations, and alerting based on the ingested data.

See [use-cases.md](./use-cases.md) for practical scenarios enabled by this pipeline.
