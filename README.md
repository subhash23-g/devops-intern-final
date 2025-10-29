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
