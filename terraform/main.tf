terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21.0"
    }
  }

  backend "s3" {
    bucket         = "jordan-resume"
    key            = "jordan-resume.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "jordan-resume-tfstate-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
}

data "aws_region" "current" {}
data "aws_elb_hosted_zone_id" "main" {}
