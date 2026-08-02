#################################
# VPC OUTPUTS
#################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}


output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}


output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}



#################################
# FRONTEND
#################################

output "frontend_instance_id" {
  description = "Frontend EC2 ID"
  value       = module.frontend_ec2.instance_id
}


output "frontend_public_ip" {
  description = "Frontend EC2 public IP"
  value       = module.frontend_ec2.public_ip
}


output "frontend_alb_dns" {
  description = "Frontend ALB DNS name"
  value       = module.frontend_alb.alb_dns_name
}



#################################
# BACKEND
#################################

output "backend_instance_id" {
  description = "Backend EC2 ID"
  value       = module.backend_ec2.instance_id
}


output "backend_private_ip" {
  description = "Backend EC2 private IP"
  value       = module.backend_ec2.private_ip
}


output "backend_alb_dns" {
  description = "Backend internal ALB DNS"
  value       = module.backend_alb.alb_dns_name
}



#################################
# MONITORING
#################################

output "monitoring_instance_id" {
  description = "Monitoring EC2 ID"
  value       = module.monitoring_ec2.instance_id
}


output "monitoring_private_ip" {
  description = "Monitoring EC2 private IP"
  value       = module.monitoring_ec2.private_ip
}



#################################
# RDS OUTPUTS
#################################

output "rds_primary_endpoint" {
  description = "Primary MySQL endpoint"
  value       = module.rds.primary_endpoint
}


output "rds_read_replica_endpoint" {
  description = "Read replica endpoint"
  value       = module.rds.read_replica_endpoint
}



#################################
# REDIS OUTPUTS
#################################

output "redis_endpoint" {
  description = "Redis endpoint"
  value       = module.elasticache.redis_endpoint
}


output "redis_port" {
  description = "Redis port"
  value       = module.elasticache.redis_port
}