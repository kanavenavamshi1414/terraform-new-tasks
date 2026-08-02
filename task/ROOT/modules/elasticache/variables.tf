variable "project_name" {

  description = "Project name"

  type = string
}


variable "private_subnet_ids" {

  description = "Private subnet IDs for Redis"

  type = list(string)
}


variable "redis_security_group_id" {

  description = "Redis security group ID"

  type = string
}


variable "redis_version" {

  description = "Redis engine version"

  type = string

  default = "7.1"
}


variable "node_type" {

  description = "Redis node instance type"

  type = string

  default = "cache.t3.micro"
}


variable "num_cache_nodes" {

  description = "Number of Redis nodes"

  type = number

  default = 2
}


variable "snapshot_retention_days" {

  description = "Redis backup retention"

  type = number

  default = 7
}