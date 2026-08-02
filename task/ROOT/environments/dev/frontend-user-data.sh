#!/bin/bash

yum update -y

# Install Docker
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Install Nginx
amazon-linux-extras install nginx1 -y || yum install -y nginx
systemctl enable nginx
systemctl start nginx

echo "<h1>Frontend Server</h1>" > /usr/share/nginx/html/index.html