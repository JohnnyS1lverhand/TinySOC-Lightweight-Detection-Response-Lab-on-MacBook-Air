# TinySOC – Lightweight Detection & Response Lab on MacBook Air

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform: Apple Silicon](https://img.shields.io/badge/Platform-MacBook%20Air%20M1-blue)
![Status: PoC](https://img.shields.io/badge/status-PoC-orange)

A minimal yet powerful SOC lab featuring Elasticsearch, Kibana, Suricata, ClamAV, and Auditd – built and tested as a proof-of-concept on a MacBook Air M1.

---

## 🚀 About the Project

**TinySOC** is a proof-of-concept (PoC) and portfolio project demonstrating that a full-featured Security Operations Center (SOC) lab can run on a lightweight Apple Silicon laptop.  
It showcases blue team detection, alerting, and log analysis skills using open-source tools and custom detection rules.

---

## 🗂️ Architecture

![Architecture diagram](diagrams/architecture.png)

---

## 🛠️ Core Components

- **Elasticsearch & Kibana:**  
  Centralized log storage, analytics, and visualization. Logs are ingested using native integrations (e.g., Elastic Agent), no Logstash required.
- **Suricata:**  
  Open-source network IDS/IPS for real-time traffic analysis and threat detection.
- **ClamAV:**  
  Antivirus engine for file scanning and malware detection.
- **Auditd:**  
  Linux auditing system for tracking security-relevant events at the OS level.

---

## 💻 Why MacBook Air M1?

This project is a PoC showing that even on a lightweight, affordable ARM-based laptop, you can run a full SOC lab stack – including resource-intensive components like Elasticsearch and Suricata – for real-world detection and response scenarios.

---

## 📊 Visualization & Alerting

- **Kibana Dashboards:**  
  Pre-built dashboards for visualizing network events, alerts, and incidents.
- **Custom Detection Rules:**  
  Detection rules for Suricata, Auditd, and Elastic Security are versioned and stored in [`rules/`](rules/).

- **Alert Integrations:**  
  Example webhook for Telegram notifications (see [Telegram.md](alerts/Webhook/Telegram/Readme.md)).

---

## 📚 Documentation

- [Architecture Overview](docs/overview.md)
- [Scripts](scripts/)
- [Setup Guides](setup/)
- [Attack & Defense Scenario](attack-defense/scenario/README.md)
- [Detection Rules](rules/)

---

## 🛡️ Detection Rules

All detection rules used in TinySOC are versioned and stored in the [`rules/`](rules/) directory:

- [`rules/suricata/`](rules/suricata/) – Suricata IDS/IPS rules
- [`rules/auditd/`](rules/auditd/) – Auditd host audit rules
- [`rules/elastic-security/`](rules/elastic-security/) – Custom Elastic Security (SIEM) detection and correlation rules (exported from Kibana/SIEM)

This structure ensures transparency, reproducibility, and easy customization of detection logic.  
You can review, modify, and extend these rules as needed for your own experiments.

---

## 🤔 FAQ

**Q: Is this project production-ready?**  
A: No, this is a proof-of-concept (PoC) and portfolio project. It is intended for educational, demonstration, and self-study purposes only. Use at your own risk.

**Q: Who maintains this project?**  
A: This repository is provided “as is” and is not actively maintained. For questions, suggestions, or contributions, please use GitHub Issues.

**Q: What virtualization platform was used?**  
A: The lab was built and tested using [UTM VM](https://mac.getutm.app/), which supports running ARM and x86 virtual machines on Apple Silicon and Intel Macs.

**Q: Why is Logstash not used in this project?**  
A: Logstash is not included to keep the lab lightweight and resource-efficient. All required log collection, parsing, and enrichment is handled by Elastic Agent and its integrations, which are sufficient for this lab scenario.

**Q: Can I use another virtualization platform (VirtualBox, VMware, Parallels, etc.)?**  
A: Yes, you can adapt the lab to other virtualization platforms, but some steps or performance may differ. UTM was chosen for its ARM support and ease of use on macOS.

**Q: Why is Elastic Agent used in standalone mode instead of Fleet?**  
A: Standalone mode was chosen for simplicity and transparency. All configuration is managed locally via YAML files, making it easier to understand and control for lab and demo purposes.

**Q: Can I extend this lab with additional detection rules or data sources?**  
A: Absolutely! You can add new rules, custom scripts, or integrate other log sources by editing the Elastic Agent configuration and detection rules.

**Q: How are alerts delivered?**  
A: Alerts are generated in Kibana and forwarded to Telegram via a custom integration for real-time notifications. See the [attack-defense/scenario](/attack-defense/scenario/) section for examples.

**Q: Where can I find documentation on each component?**  
A: See the [docs/](/docs) directory for architecture overview, component descriptions, data flow, and use cases. Each detection rule also has its own documentation in the [rules/](/rules) directory.

---

If you have more questions, please open an Issue or Pull Request!


## 📜 License

This project is licensed under the MIT License.

---

**TinySOC proves that you don’t need a server to practice cybersecurity – your MacBook Air is enough!**

## Disclaimer

⚠️ This repository is intended solely for educational purposes and defensive security research. 
All materials are provided "as is" without warranties of any kind. Offensive tools and cleanup scripts have been intentionally excluded to prevent misuse.

❗ Users are solely responsible for ensuring their actions comply with all applicable local, national, and international laws. Any unauthorized or malicious use of the information contained here is strictly prohibited.

🛡️ The author disclaims all liability for damages resulting from any misuse of this material. By using this repository, you agree to these terms and accept full responsibility for your actions.
