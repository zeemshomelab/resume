variable "prefix" {
  default = "jordan"
}

variable "project" {
  default = "resume"
}

variable "contact" {
  default = "jpiel.devops@gmail.com"
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
    prod  = ""
    stage = "stage."
  }
}
