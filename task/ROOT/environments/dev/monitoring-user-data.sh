#!/bin/bash

yum update -y

# Docker
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

docker network create monitoring

##################################
# Prometheus
##################################

mkdir -p /opt/prometheus

cat > /opt/prometheus/prometheus.yml <<EOF
global:
  scrape_interval: 15s

scrape_configs:

  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node-exporter"
    static_configs:
      - targets: ["localhost:9100"]
EOF

docker run -d \
--name prometheus \
--restart unless-stopped \
-p 9090:9090 \
-v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
--network monitoring \
prom/prometheus

##################################
# Grafana
##################################

docker run -d \
--name grafana \
--restart unless-stopped \
-p 3000:3000 \
--network monitoring \
grafana/grafana

##################################
# Node Exporter
##################################

docker run -d \
--name node-exporter \
--restart unless-stopped \
-p 9100:9100 \
--network monitoring \
prom/node-exporter