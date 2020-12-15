variable "prefix" {
  default = "jordan-resume"
}

variable "project" {
  default = "resume"
}

variable "contact" {
  default = "JBenPiel@gmail.com"
}

variable "bastion_key_name" {
  default = "jordan-resume-bastion"
}

variable "ecr_image_resume" {
  description = "ECR image for Resume"
  default     = "727688841385.dkr.ecr.us-east-1.amazonaws.com/jordan-resume:latest"
}

variable "dns_zone_name" {
  description = "Domain name"
  default     = "jordanpiel.net"
}

variable "subdomain" {
  description = "Subdomain per environment"
  type        = map(string)
  default = {
    production = "resume"
    staging    = "resume.staging"
  }
}
