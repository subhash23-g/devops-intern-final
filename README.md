hello.py

## 🐳 Docker Instructions

To build the image:
docker build -t devops-hello .

To run the container:
docker run devops-hello

### How to Deploy the Nomad Service

This service runs our Docker container using HashiCorp Nomad.

To start the job on a running Nomad cluster, use this command:

```bash
nomad job run nomad/hello.nomad
```

version: "3.7"

networks:
loki-net:

services:

# 1. Loki: The log aggregation backend

loki:
image: grafana/loki:latest
container_name: loki
ports: - "3100:3100"
command: -config.file=/etc/loki/config.yaml
volumes: - ./loki-config.yaml:/etc/loki/config.yaml
networks: - loki-net

# 2. Promtail: The log collection agent

promtail:
image: grafana/promtail:latest
container_name: promtail
volumes: - /var/lib/docker/containers:/var/lib/docker/containers:ro # Mounts Docker logs - ./promtail-config.yaml:/etc/promtail/config.yaml
command: -config.file=/etc/promtail/config.yaml
networks: - loki-net
depends_on: - loki

# 3. Grafana: The visualization UI

grafana:
image: grafana/grafana:latest
container_name: grafana
ports: - "3000:3000"
environment: # Automatically adds Loki as a data source on startup - GF_INSTALL_PLUGINS=grafana-loki-datasource - GF_AUTH_ANONYMOUS_ENABLED=true
networks: - loki-net
depends_on:

    execution command:

      docker-compose up -d

The LogQL Query
​This query selects all log streams that have the label job set to container_logs and then filters those streams for lines containing the word error (case-insensitive).

    {job="container_logs"} |= "error" | limit 100
