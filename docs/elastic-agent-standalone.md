# Elastic Agent Standalone Mode

Elastic Agent is configured and managed locally on each host, without centralized Fleet management.

## Key Points

- All configuration is done via YAML files (`elastic-agent.yml`, `inputs.d/*.yml`).
- Each input (log, metric, etc.) must be defined explicitly.
- Changes require manual editing and service restart.

## Example Input Configuration
```yaml
inputs:
  - id: auditd-logs
    type: logfile
    data_stream.namespace: default
    paths:
      - /var/log/audit/audit.log
    use_output: default

  - id: suricata-logs
    type: logfile
    data_stream.namespace: default
    paths:
      - /var/log/suricata/eve.json
    use_output: default

  - id: clamav-logs
    type: logfile
    data_stream.namespace: default
    paths:
      - /var/log/clamav/*.log
    use_output: default
```

## Applying Changes

After editing configuration files, restart the agent:

```
sudo systemctl restart elastic-agent
```

See the [official documentation](https://www.elastic.co/guide/en/fleet/current/elastic-agent-configuration.html) for details.

---
