variable "project_name" {

  type = string

}


variable "private_subnet_ids" {

  type = list(string)

}


variable "rds_security_group_id" {

  type = string

}


variable "engine_version" {

  type = string

  default = "8.0"

}


variable "instance_class" {

  type = string

  default = "db.t3.micro"

}


variable "replica_instance_class" {

  type = string

  default = "db.t3.micro"

}


variable "storage_size" {

  type = number

  default = 20

}


variable "db_username" {

  type = string

}


variable "db_password" {

  type      = string

  sensitive = true

}


variable "database_name" {

  type = string

}