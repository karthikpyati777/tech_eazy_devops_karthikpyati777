


##############################
# Terraform Variables File
##############################

# AWS region to deploy resources
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Deployment stage (dev/prod)
variable "stage" {
  description = "Deployment stage (dev/prod)"
  type        = string
  default     = "dev"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Name of the existing AWS key pair
variable "key_name" {
  description = "Name of the existing AWS key pair (without .pem)"
  type        = string
  default     = "karthikkeypair"
}

# GitHub repository URL
variable "repo_url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/karthikpyati777/tech_eazy_devops_karthikpyati777.git"
}

# Ubuntu 22.04 AMI ID (update as per region)
variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID (update as per region)"
  type        = string
  default     = "ami-0360c520857e3138f" # us-east-1 Ubuntu 22.04 LTS
}

# Subnet ID for launching EC2 instance
variable "subnet_id" {
  description = "The subnet ID where EC2 instance will be launched"
  type        = string
  default     = "subnet-0c9e8753b583cde02"
}


