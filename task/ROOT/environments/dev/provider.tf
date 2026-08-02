terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Optional: Remote state for team usage
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "dev/vpc/terraform.tfstate"
  #   region = "eu-north-1"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "dev"
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}