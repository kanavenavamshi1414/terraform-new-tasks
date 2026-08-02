variable "kms_key_id" {
  description = "KMS key for root volume encryption. Leave null to use account default EBS key."
  type        = string
  default     = null
}

resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  associate_public_ip_address = var.associate_public_ip

  user_data = var.user_data

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = var.kms_key_id
  }

  tags = {
    Name = var.instance_name
    Role = var.role
  }

  lifecycle {
    create_before_destroy = true
  }

  timeouts {
    create = "10m"
  }
}