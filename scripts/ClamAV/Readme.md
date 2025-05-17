# ClamAV Multi-User Custom Logging Script

## Overview

[`SCAN_AV.sh`](SCAN_AV.sh) is a Bash script that scans the `Downloads` directory of **every user** on the system for malware using [ClamAV](https://www.clamav.net/). Any detected threats are logged in a custom, structured format, including the file path, detected malware signature, and a SHA-256 hash of the infected file.

> **Note:**  
> The script uses the `Downloads` directory as an example. You can easily modify it to scan any other directory or set of directories as needed.

## Purpose

The script is designed to generate custom log entries for malware detections, making it easy to collect and analyze them with log aggregation tools such as the **ELK stack** (Elasticsearch, Logstash, Kibana). The default ClamAV logs are not always convenient for automated parsing or further analysis, so this script provides a more structured and machine-friendly log output.

## How It Works

1. **Scans all users' Downloads directories:**  
   Recursively scans the `Downloads` folder for every user found in `/home/*/Downloads`.

2. **Processes only infected files:**  
   If no threats are found, the script exits quietly.

3. **Calculates file hashes:**  
   For each infected file, the script calculates a SHA-256 hash.

4. **Custom log formatting:**  
   For every detected threat, the script writes a log entry in the format:  

[Malware Signature] FOUND on [File Path] - HASH: [SHA256]

This makes it easy to ingest and analyze with ELK or similar tools.

## Example Log Entry

Eicar-Test-Signature FOUND on /home/alice/Downloads/eicar.com.txt - HASH: abcd1234ef567890...


## Usage

1. **Install ClamAV:**  
   Make sure you have ClamAV installed and the virus database updated.

2. **Set permissions:**  
   The script writes logs to `/var/log/clamav/clamscan.log`, so you may need to run it with `sudo` or as root.

3. **Run the script:**  

`./SCAN_AV.sh`


4. **(Optional) Scan other directories:**  
The script is set up to scan `Downloads` directories as an example.  
You can change the scanned paths in the script to any directory you need. For example, to scan the entire home directory for each user:

`for HOME_DIR in /home/*; do
[ -d "$HOME_DIR" ] || continue
clamscan -r --infected --no-summary "$HOME_DIR" >> "$TMP_SCAN"
done`

Or specify any custom path.

5. **(Optional) Include root's Downloads:**  
If you want to also scan `/root/Downloads`, add the following lines to the script:

`if [ -d "/root/Downloads" ]; then
clamscan -r --infected --no-summary "/root/Downloads" >> "$TMP_SCAN"
fi`

## Integration with ELK: Parsing Custom Logs with Ingest Pipeline

To make your custom ClamAV logs easily searchable and filterable in Elasticsearch and Kibana, you can use an **Ingest Pipeline** with a GROK processor that parses each log entry into structured fields.

### Example GROK Pattern

Below is a GROK pattern for use in your `logs-clamav` ingest pipeline.  
It extracts the malware signature, full file path, filename, and SHA-256 hash from each log line:

```json
{
"grok": {
"field": "message",
"patterns": [
"%{DATA:clamav.signature} FOUND on %{GREEDYDATA:clamav.filepath}/%{GREEDYDATA:clamav.filename} - HASH: (?<clamav.hash>[A-Fa-f0-9]{64})"
]
}
}
```

**What this does:**
- **clamav.signature** – the malware signature name (e.g., Eicar-Test-Signature)
- **clamav.filepath** – the full path to the directory containing the infected file
- **clamav.filename** – the infected file’s name
- **clamav.hash** – the SHA-256 hash of the file

### How to use

1. **Create an ingest pipeline** in Kibana or via the Elasticsearch API with the above GROK processor.
2. **Assign the pipeline** to your Filebeat/Elastic Agent input or directly to the index.
3. **Result:**  
   Each log line like  
   `Eicar-Test-Signature FOUND on /home/alice/Downloads/eicar.com.txt - HASH: abcd1234ef567890...`  
   will be parsed into structured fields in Elasticsearch, making it easy to build dashboards, alerts, and searches in Kibana.

---

**Example Ingest Pipeline Creation (via Dev Tools):**

```json
PUT _ingest/pipeline/logs-clamav
{
  "description": "Parse custom ClamAV scan logs",
  "processors": [
    {
      "grok": {
        "field": "message",
        "patterns": [
          "%{DATA:clamav.signature} FOUND on %{GREEDYDATA:clamav.filepath}/%{GREEDYDATA:clamav.filename} - HASH: (?<clamav.hash>[A-Fa-f0-9]{64})"
        ]
      }
    }
  ]
}
```

---

**Why this matters:**  
With this pipeline, your ClamAV detections become fully structured and actionable in the ELK stack, supporting advanced analytics, alerting, and reporting.

---

**Tip:**  
You can further enhance the pipeline with additional processors (e.g., date, geoip, user agent) if your logs include more information.

---

**References:**  
- [ClamAV Official Site](https://www.clamav.net/)
- [Elasticsearch Ingest Pipelines Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/ingest.html)
- [GROK Patterns Reference](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html)
