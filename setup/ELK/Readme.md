# Elasticsearch

**Elasticsearch** is a distributed, open-source search and analytics engine built on top of Apache Lucene. It enables you to store, search, and analyze large volumes of data in real-time. Elasticsearch is widely used for full-text search, structured queries, and powerful data analysis.

---

## Features

- **Full-text search** and filtering
- **Real-time analytics** and aggregations
- **RESTful API** for easy integration
- **Horizontal scalability** and high availability
- **Flexible schema** and document-oriented storage

---

## Installation

1. **Download the installation package** and navigate to the directory:
    ```
    cd /home/tools/elasticsearch
    ```

2. **Install the package as root:**
    ```
    sudo dpkg -i elasticsearch*.deb
    ```

3. **Enable and start the Elasticsearch service:**
    ```
    sudo systemctl daemon-reload
    sudo systemctl enable elasticsearch.service
    sudo systemctl start elasticsearch.service
    ```

4. **Check the service status:**
    ```
    sudo systemctl status elasticsearch.service
    ```

> **Note:** During the first installation, the setup will display a default password for the `elastic` user. Make sure to save it for future use.

## Example

![image](https://github.com/user-attachments/assets/6595238e-f71c-48cd-8958-8d77ec34fd59)

---

## Configuration

All configuration files are located in `/etc/elasticsearch`:

- **elasticsearch.yml**: Main configuration file (network, cluster, storage, logging)
- **jvm.options**: JVM settings (memory, garbage collection, etc.)
- **log4j2.properties**: Logging configuration
- **users, roles.yml, roles_mapping.yml**: User, role, and permissions management

### Example: Network Configuration

Edit `elasticsearch.yml` to set the network host and HTTP port:

`network.host: 127.0.0.1`

`http.port: 9200`

After making changes, restart the service:

```
systemctl restart elasticsearch.service
```

# Kibana

**Kibana** is an open-source data visualization and exploration tool designed for use with Elasticsearch. It provides a powerful web interface for searching, visualizing, and managing data stored in Elasticsearch, making it an essential component of the Elastic Stack for monitoring, analytics, and operational intelligence.

---

## Features

- **Interactive dashboards** and visualizations
- **Real-time data exploration** and analytics
- **Powerful search interface** for Elasticsearch data
- **Management of Elasticsearch indices and settings**
- **Alerting, reporting, and machine learning integrations**
- **Role-based access control** and security features

---

## Installation

1. **Download the installation package** and navigate to the directory:
    ```
    cd /home/tools/kibana
    ```

2. **Install the package as root:**
    ```
    sudo dpkg -i kibana*.deb
    ```

3. **Enable and start the Elasticsearch service:**
    ```
    sudo systemctl daemon-reload
    sudo systemctl enable kibana.service
    sudo systemctl start kibana.service
    ```

4. **Check the service status:**
    ```
    sudo systemctl status kibana.service
    ```
### Example: Network Configuration

`server.port: 5601` => Kibana runs on port 5601 by default.

`server.host: "0.0.0.0"` => This is important to note that; if the server IP is changed, it should be updated here. The server's IP does not change in a production environment; in that case, this parameter will not be changed often.

`elasticsearch.hosts: ["http://localhost:9200"]`

Once the changes are made, and the config file is saved, its time to restart the Kibana server using the following command:

```
systemctl restart kibana.service
```
---

## Required Encryption Keys

Kibana requires three encryption keys for secure and stable operation, especially for alerting, reporting, and session management.  
You can generate strong random keys using the built-in command:

```
/usr/share/kibana/bin/kibana-encryption-keys generate
```

Copy the generated values and add them to your `kibana.yml`:

`xpack.encryptedSavedObjects.encryptionKey: "your-32-character-encryption-key"`

`xpack.reporting.encryptionKey: "your-32-character-reporting-key"`

`xpack.security.encryptionKey: "your-32-character-security-key"`

- All keys must be at least 32 characters long.
- For production and clustered deployments, **all Kibana instances must use the same keys** for consistent operation.
- For better security, you can store these keys in the Kibana Keystore instead of plain text in `kibana.yml`.

After setting the keys, restart Kibana:

```
systemctl restart kibana.service
```

## Demonstration

> **Note:**  
> After installing Kibana, open `http://MACHINE_IP:5601` in your browser.  
> 
> - Generate an enrollment token for Kibana:
>   ```
>   /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
>   ```
> - Enter the token in the browser interface.  
> - When prompted, enter the `elastic` user credentials (generated during Elasticsearch installation).  
> - If asked for a verification code, run:
>   ```
>   /usr/share/kibana/bin/kibana-verification-code
>   ```
>   and enter the code in the browser.
> 
> After successful enrollment and authentication, Kibana will be ready for use.

Congrats, Kibana is installed properly:

<img width="518" alt="image" src="https://github.com/user-attachments/assets/13660c4b-87a6-45b2-8097-375013263b24" />

Kibana can be used to visualize the logs that are parsed!

---

**References:**  
- Use the [`kibana-encryption-keys generate`](https://www.elastic.co/docs/reference/kibana/commands/kibana-encryption-keys) command to generate secure keys and ensure they are set in your configuration for production deployments.  
- For additional security, prefer storing secrets in the Kibana Keystore rather than in plain text.
