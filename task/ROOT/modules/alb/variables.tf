variable "alb_name" {

  type = string

}


variable "internal" {

  type = bool

}


variable "subnet_ids" {

  type = list(string)

}


variable "security_groups" {

  type = list(string)

}


variable "vpc_id" {

  type = string

}


variable "target_port" {

  type = number

}


variable "health_check_path" {

  type = string

  default = "/"

}


variable "instance_ids" {

  type = list(string)

}