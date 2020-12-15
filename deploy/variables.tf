variable "prefix" {
  default = "resume"
}

variable "project" {
  default = "jordan-resume"
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
