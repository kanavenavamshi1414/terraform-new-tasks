variable "vpc_id" {
  type = string
}


variable "project_name" {
  type = string
}


variable "backend_port" {
  type    = number
  default = 5000
}


variable "admin_cidr" {
  type = list(string)
}