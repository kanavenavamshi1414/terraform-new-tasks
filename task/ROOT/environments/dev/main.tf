#################################
# VPC MODULE
#################################

module "vpc" {
  source = "../../modules/vpc"

  vpc_name = var.project_name
  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

#################################
# SECURITY GROUP MODULE
#################################

module "security_group" {

  source = "../../modules/security-group"


  project_name = var.project_name


  vpc_id = module.vpc.vpc_id


  admin_cidr = var.admin_cidr


  backend_port = var.backend_port
}



#################################
# FRONTEND EC2
#################################

module "frontend_ec2" {

  source = "../../modules/ec2"

  ami_id = var.ami_id

  instance_type = var.frontend_instance_type

  instance_name = "frontend-server"

  role = "frontend"

  subnet_id = module.vpc.public_subnet_ids[0]

  security_group_ids = [
    module.security_group.frontend_sg_id
  ]

  key_name = var.key_name

  associate_public_ip = true

  volume_size = 20

  user_data = file("${path.module}/frontend-user-data.sh")
}


#################################
# BACKEND EC2
#################################

module "backend_ec2" {

  source = "../../modules/ec2"

  ami_id = var.ami_id

  instance_type = var.backend_instance_type

  instance_name = "backend-server"

  role = "backend"

  subnet_id = module.vpc.private_subnet_ids[0]

  security_group_ids = [
    module.security_group.backend_sg_id
  ]

  key_name = var.key_name

  volume_size = 20

  user_data = file("${path.module}/backend-user-data.sh")
}



#################################
# MONITORING EC2
#################################

module "monitoring_ec2" {

  source = "../../modules/ec2"

  ami_id = var.ami_id

  instance_type = var.monitoring_instance_type

  instance_name = "monitoring-server"

  role = "monitoring"

  subnet_id = module.vpc.private_subnet_ids[1]

  security_group_ids = [
    module.security_group.monitoring_sg_id
  ]

  key_name = var.key_name

  volume_size = 30

  user_data = file("${path.module}/monitoring-user-data.sh")
}


#################################
# FRONTEND ALB
#################################

module "frontend_alb" {

  source = "../../modules/alb"


  alb_name = "frontend-alb"


  internal = false


  subnet_ids = module.vpc.public_subnet_ids


  security_groups = [
    module.security_group.frontend_sg_id
  ]


  vpc_id = module.vpc.vpc_id


  target_port = 80


  health_check_path = "/"


  instance_ids = [
    module.frontend_ec2.instance_id
  ]
}



#################################
# BACKEND ALB
#################################

module "backend_alb" {

  source = "../../modules/alb"


  alb_name = "backend-alb"


  internal = true


  subnet_ids = module.vpc.private_subnet_ids


  security_groups = [
    module.security_group.backend_sg_id
  ]


  vpc_id = module.vpc.vpc_id


  target_port = var.backend_port


  health_check_path = "/health"


  instance_ids = [
    module.backend_ec2.instance_id
  ]
}



#################################
# RDS MYSQL
#################################

module "rds" {

  source = "../../modules/rds"


  project_name = var.project_name


  private_subnet_ids = module.vpc.private_subnet_ids


  rds_security_group_id = module.security_group.rds_sg_id


  database_name = var.database_name


  db_username = var.db_username


  db_password = var.db_password
}



#################################
# ELASTICACHE REDIS
#################################

module "elasticache" {

  source = "../../modules/elasticache"


  project_name = var.project_name


  private_subnet_ids = module.vpc.private_subnet_ids


  redis_security_group_id = module.security_group.redis_sg_id


  node_type = var.redis_node_type


  num_cache_nodes = var.redis_nodes
}