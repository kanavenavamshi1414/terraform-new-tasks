output "frontend_sg_id" {
  value = aws_security_group.frontend.id
}


output "backend_sg_id" {
  value = aws_security_group.backend.id
}


output "rds_sg_id" {
  value = aws_security_group.rds.id
}


output "monitoring_sg_id" {
  value = aws_security_group.monitoring.id
}

output "redis_sg_id" {

  value = aws_security_group.redis.id
}