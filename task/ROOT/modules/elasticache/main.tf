resource "aws_elasticache_subnet_group" "this" {

  name = "${var.project_name}-redis-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-redis-subnet-group"
  }
}


resource "aws_elasticache_replication_group" "this" {

  replication_group_id = "${var.project_name}-redis"

  description = "Redis cache cluster for application"


  engine = "redis"

  engine_version = var.redis_version


  node_type = var.node_type


  num_cache_clusters = var.num_cache_nodes


  port = 6379


  subnet_group_name = aws_elasticache_subnet_group.this.name


  security_group_ids = [
    var.redis_security_group_id
  ]


  # High availability

  automatic_failover_enabled = true

  multi_az_enabled = true


  # Security

  at_rest_encryption_enabled = true

  transit_encryption_enabled = true


  # Backup

  snapshot_retention_limit = var.snapshot_retention_days


  tags = {
    Name = "${var.project_name}-redis"
  }
}