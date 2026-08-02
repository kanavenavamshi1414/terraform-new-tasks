#!/bin/bash

yum update -y

# Install Docker
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Python
yum install -y python3 git

mkdir -p /opt/backend