# Attack & Defense Scenarios

This section of the TinySOC Lightweight Lab demonstrates real-world attack and defense workflows. Here you will find practical scenarios where attacks are launched from Kali Linux, and defensive mechanisms are validated using Elastic Agent, auditd, Suricata, and ClamAV.

## Structure

- **scenario/** - Step-by-step guides for various attack and defense exercises, including:
    - Attack execution from Kali Linux
    - Detection and alerting workflow
    - Log analysis in Kibana
    - Real-time alert notifications via Telegram

## How It Works

1. **Attack Simulation:**  
   You execute attacks from Kali Linux (for example, brute force, reverse shell, privilege escalation, malware execution, etc.).

2. **Detection:**  
   The lab environment (auditd, Suricata, ClamAV, Elastic Agent) detects suspicious activity and generates logs.

3. **Alerting:**  
   Alerts are triggered in Kibana based on detection rules.  
   Alerts are automatically forwarded to a Telegram chat via integration.

4. **Incident Analysis:**  
   - The alert in Telegram contains key details (rule name, timestamp, source, etc.).
   - You can click through to Kibana to view detailed logs and investigate the incident.

## Scenario Library

See the [scenario](./scenario/) folder for detailed, step-by-step attack and defense walkthroughs with screenshots and log examples.

---

**Tip:**  
You can extend this section with your own attack scenarios and detection rules.  
For more on alerting integrations, see the [Kibana documentation](https://www.elastic.co/guide/en/kibana/current/alert-action-telegram.html) and [Telegram API docs](https://core.telegram.org/bots/api).
