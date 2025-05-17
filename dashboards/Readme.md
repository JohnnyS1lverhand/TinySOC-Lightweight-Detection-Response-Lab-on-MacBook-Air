# Kibana Dashboards Import Guide

This repository contains pre-built Kibana dashboards and visualizations for monitoring logs and security events from Elastic Agent, auditd, Suricata, and ClamAV.  
You can quickly import these dashboards into your Kibana instance for instant visibility and analytics.

---

## Contents

- **[kibana-export.ndjson](/dashboards/kibana-export.ndjson)** – Exported dashboards, visualizations, and index patterns (compatible with Kibana 8.x+)
- Dashboards include:
    - Auditd log analytics
    - Suricata alerts overview
    - ClamAV detection statistics
    - Elastic Agent error and activity panels
    - Security alert summaries

---

## How to Import Dashboards into Kibana

You can import dashboards using either the Kibana web UI or the API.

### **Method 1: Import via Kibana UI**

1. **Log in to Kibana.**
2. In the left navigation, go to **Stack Management** → **Saved Objects**.
3. Click the **Import** button.
4. Select the [kibana-export.ndjson](/dashboards/kibana-export.ndjson) file from this repository.
5. (Recommended) Enable **Automatically overwrite all saved objects** to update existing dashboards if necessary.
6. Click **Import**.
7. After import, dashboards and visualizations will be available in the **Dashboards** section.

> **Note:**  
> Make sure all required index patterns (e.g., `logs-*`, `logs-suricata*`, `logs-clamav*`) exist and are populated in your Elasticsearch.  
> If you use Elastic Agent integrations for auditd, Suricata, or ClamAV, the default index patterns should match automatically.

---

### **Method 2: Import via Kibana API**

You can also import dashboards programmatically with a POST request:
```
curl -X POST "https://<KIBANA_HOST>:<PORT>/api/saved_objects/_import"
-H "kbn-xsrf: true"
-H "Content-Type: multipart/form-data"
-F "file=@kibana-export.ndjson"
```

- Replace `<KIBANA_HOST>` and `<PORT>` with your Kibana address (e.g., `localhost:5601`).
- You may need to add authentication headers if your Kibana instance requires login.

For more details, see the [Kibana Import API documentation](https://www.elastic.co/guide/en/kibana/current/dashboard-import-api.html).

---

## Troubleshooting

- **Missing index patterns:**  
  If you see errors about missing index patterns after import, ensure that your data integrations (Elastic Agent, auditd, Suricata, ClamAV) are sending data to the correct indices (e.g., `logs-*`, `logs-suricata*`, `logs-clamav*`).
- **No data in dashboards:**  
  Check that data is flowing from your agents and integrations to Elasticsearch, and that the time range in the dashboard matches your data.

---

## References

- [Kibana Dashboard Import API](https://www.elastic.co/guide/en/kibana/current/dashboard-import-api.html)
- [Export and Import Kibana Dashboards (AWS Blog)](https://aws.amazon.com/blogs/big-data/export-and-import-kibana-dashboards-with-amazon-es/)
- [Kibana documentation](https://www.elastic.co/guide/en/kibana/current/index.html)

---

![Dashboard_example](https://github.com/user-attachments/assets/afa7f603-10e2-40e2-9c5f-23f20ef7680b)


Your dashboards are now ready!  
Explore and analyze your logs and security events with the imported visualizations in Kibana.
