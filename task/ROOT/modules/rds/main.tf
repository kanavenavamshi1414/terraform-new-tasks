# DB subnet group (private subnets)

resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}


# Primary MySQL Database

resource "aws_db_instance" "primary" {

  identifier = "${var.project_name}-mysql-primary"


  engine = "mysql"

  engine_version = var.engine_version


  instance_class = var.instance_class


  allocated_storage = var.storage_size

  storage_type = "gp3"


  username = var.db_username

  password = var.db_password


  db_name = var.database_name


  db_subnet_group_name = aws_db_subnet_group.this.name


  vpc_security_group_ids = [
    var.rds_security_group_id
  ]


  # High Availability

  multi_az = false


  # Security

  storage_encrypted = true


  publicly_accessible = false


  # Backup

  backup_retention_period = 7


  backup_window = "03:00-04:00"


  maintenance_window = "sun:04:00-sun:05:00"


  deletion_protection = false


  skip_final_snapshot = true


  tags = {

    Name = "${var.project_name}-primary-rds"

  }
}



# Read Replica

resource "aws_db_instance" "read_replica" {


  identifier = "${var.project_name}-mysql-read-replica"


  replicate_source_db = aws_db_instance.primary.identifier


  instance_class = var.replica_instance_class


  storage_type = "gp3"


  publicly_accessible = false


  storage_encrypted = true

  skip_final_snapshot = true


  depends_on = [

    aws_db_instance.primary

  ]


  tags = {

    Name = "${var.project_name}-read-replica"

  }
}