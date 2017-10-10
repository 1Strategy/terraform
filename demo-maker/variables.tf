################################################################################
# Global
################################################################################

variable "aws_region" {
  description = "The AWS region we are using."
  default     = "us-west-2"
}

variable "demo_name" {
    default = "1s_ecs_demo"
}

variable "demo" {
    description = "What type of demo would you like to run?"
}

variable "Q1" {
    description = "Do you have any special variables?"
}

################################################################################
# VPC
################################################################################

variable "vpc_cidr_block"{
    description = "VPC CIDR"
    default     = "10.25.0.0/16"
}

variable "subnet_cidr_blocks" {
    default = ["10.25.0.0/19", "10.25.32.0/19"]
    # , "10.25.64.0/19", "10.25.96.0/19"]
}

variable "azs"{
    default = ["us-west-2a", "us-west-2b"]
}

################################################################################
# ECR Repo
################################################################################

variable "ecr-repo-name" {
    default = "1S ECS Demo Repo"
}

################################################################################
# ECS Cluster
################################################################################

variable "ecs_cluster_name" {
  default = "1S-ECS-Demo-Cluster"
}

################################################################################
# Task Definition
################################################################################

variable "docker_image" {
  description = "location of docker image for our ECS service"
  default     = "nginx:latest"
  # default     = "842337631775.dkr.ecr.us-west-2.amazonaws.com/1s-ecs-demo-repo:nginx_1.0.0"
}

variable "container_memory" {
  description = "Memory variable for the container."
  default = "512"
}

variable "container_port" {
  description = "Port number for the container."
  default     = 80
}

################################################################################
# Launch Config
################################################################################

variable "ami_image_id" {
  description = "Image ID for the AMI"
  # AMI for ECS optimized instances in Oregon
  default     = "ami-29f80351"
  }

variable "instance_type" {
  description = "Instance size"
  default     = "t2.micro"
  }

################################################################################
# Autoscaling Group
################################################################################

variable "asg_min" {
  description = "Min numbers of EC2s in ASG"
  default     = 1
}

variable "asg_max" {
  description = "Max numbers of EC2s in ASG"
  default     = 3
}

variable "asg_desired" {
  description = "Desired numbers of EC2s in ASG"
  default     = 2
}