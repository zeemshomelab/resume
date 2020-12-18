variable "prefix" {
  default = "jordan"
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
  default     = "public.ecr.aws/e7k4f6o3/jordan-resume:latest"
}

variable "dns_zone_name" {
  description = "Domain name"
  default     = "jordanpiel.net"
}

variable "subdomain" {
  description = "Subdomain per environment"
  type        = map(string)
  default = {
    prod  = "resume"
    stage = "stage.resume"
  }
}
