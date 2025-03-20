variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "Subnet IDs for the EC2 instances"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security group ID of the bastion host"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 6
}

variable "project_name" {
  description = "Name of the project for resource naming"
  type        = string
  default     = "aws-infra"
}
