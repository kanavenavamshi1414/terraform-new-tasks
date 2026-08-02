#################################
# General
#################################

variable "project_name" {
  description = "Project name"
  type        = string
}


variable "aws_region" {
  description = "AWS region"
  type        = string
}


#################################
# VPC
#################################

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}


variable "vpc_name" {
  description = "VPC name"
  type        = string
}


variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}


variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}


variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}


#################################
# Security Groups
#################################

variable "admin_cidr" {
  description = "Allowed admin IP"
  type        = list(string)
}


variable "backend_port" {
  description = "Backend application port"
  type        = number
  default     = 5000
}


#################################
# EC2
#################################

variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}


variable "key_name" {
  description = "EC2 key pair"
  type        = string
}


variable "frontend_instance_type" {
  description = "Frontend EC2 type"
  type        = string
  default     = "t3.micro"
}


variable "backend_instance_type" {
  description = "Backend EC2 type"
  type        = string
  default     = "t3.micro"
}


variable "monitoring_instance_type" {
  description = "Monitoring EC2 type"
  type        = string
  default     = "t3.medium"
}



#################################
# RDS
#################################

variable "database_name" {
  description = "Database name"
  type        = string
}


variable "db_username" {
  description = "Database username"
  type        = string
}


variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}



#################################
# ElastiCache Redis
#################################

variable "redis_node_type" {
  description = "Redis node type"
  type        = string
  default     = "cache.t3.micro"
}


variable "redis_nodes" {
  description = "Number of Redis nodes"
  type        = number
  default     = 2
}