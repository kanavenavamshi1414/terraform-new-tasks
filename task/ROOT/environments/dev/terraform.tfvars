#################################
# General
#################################

project_name = "three-tier-dev"

aws_region = "eu-north-1"



#################################
# VPC
#################################

vpc_name = "three-tier-vpc"

vpc_cidr = "10.0.0.0/16"


public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]


private_subnet_cidrs = [
  "10.0.10.0/24",
  "10.0.20.0/24"
]


availability_zones = [
  "eu-north-1a",
  "eu-north-1b"
]



#################################
# Security
#################################

# Replace with your IP
admin_cidr = [
  "49.43.200.1/32"
]


backend_port = 5000



#################################
# EC2
#################################

# Amazon Linux 2023 AMI example
ami_id = "ami-0cc0615fa97a31072"


key_name = "alpkey"


frontend_instance_type = "t3.micro"


backend_instance_type = "t3.micro"


monitoring_instance_type = "t3.micro"



#################################
# RDS MySQL
#################################

database_name = "three_tire_db"


db_username = "admin"


db_password = "Vamshi123"



#################################
# ElastiCache Redis
#################################

redis_node_type = "cache.t3.micro"


redis_nodes = 2